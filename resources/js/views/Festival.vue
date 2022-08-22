<template>
  <div>
    <van-nav-bar
      :title="festival_name"
      left-text="返回"
      left-arrow
      @click-left="onClickLeft"
    />
    <div class="banner">
      <img :src="img" alt="" />
    </div>
    <sub-title title="節日意義"></sub-title>
    <div class="festival-meaning">
      <p>
        {{ meaning }}
      </p>
    </div>
    <sub-title title="推薦花種"></sub-title>
    <div class="flower-grid">
      <img
        v-if="isLoading"
        src="../assets/images/loading.gif"
        alt=""
        class="loadingImg"
      />
      <van-grid :column-num="3" clickable v-else>
        <van-grid-item
          v-for="item in flower_species"
          :key="item.name"
          :icon="item.img"
          :text="item.name"
          :to="{ path: '/category', query: { label: item.name } }"
        >
          <van-image :src="item.img" rel="external nofollow" class="grid-img" />
          <p>{{ item.name }}</p>
        </van-grid-item>
      </van-grid>
    </div>
  </div>
</template>

<script>
import SubTitle from '../components/SubTitle.vue'
export default {
  components: { SubTitle },
  data () {
    return {
      flower_species: [],
      isLoading: true,
      festival_name: '',
      meaning: '',
      img: ''
    }
  },
  name: 'Festival',
  methods: {
    onClickLeft () {
      this.$router.push('/')
    }
  },
  mounted () {
    console.log(this.$route.params.name)
    this.festival_name = this.$route.params.name
    var bodyFormData = new FormData()
    bodyFormData.append('festival', this.$route.params.name)
    this.axios.post('/festival2flower', bodyFormData).then(res => {
      console.log(res.data)
      this.img = res.data[0].img
      this.meaning = res.data[0].meaning
      const promises = []
      for (var i = 0; i < res.data.length; i++) {
        promises.push(this.axios.get(`/getImage?label=${res.data[i].name}`))
      }

      Promise.all(promises).then(responses => {
        const finalObj = []
        responses.forEach((item, index) => {
          var obj = {}
          obj.name = res.data[index].name
          if (item.data.length !== 0) {
            obj.img = item.data[0].image
          } else {
            obj.img = require('../assets/images/default.jpeg')
          }
          finalObj.push(obj)
        })
        this.flower_species = finalObj
        this.isLoading = false
      })
    })
  }
}
</script>
<style lang="scss" scoped>
.banner {
  padding: 10px;
  background-color: hsl(358, 100%, 68%);
  img {
    width: 100%;
    border-radius: 2px;
  }
}
// .van-nav-bar {
//  background-color: rgb(241, 186, 66);
// }
.van-nav-bar {
  ::v-deep .van-icon {
    color: hsl(358, 100%, 68%);
  }
  ::v-deep .van-nav-bar__text {
    color: hsl(358, 100%, 68%);
  }
  ::v-deep .van-ellipsis {
    color: #202020;
    opacity: 0.7;
  }
}

.festival-meaning {
  padding: 0px 20px;
  p {
    font-size: 12px;
    color: #202020;
    opacity: 0.7;
  }
}
.flower-grid {
  text-align: center;
  padding: 30px;
  padding-top: 0;
  margin-bottom: 60px;
  text-align: center;
  .grid-img{
    width: 60px;
    height: 60px;
  }
  p{
    font-size: 14px;
    margin-top: 15px;
    color: #646566;
  }
}
</style>
