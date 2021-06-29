<template>
  <div>
    <div
      style="position: sticky; top: 0px; z-index:9999; background-color: #ffffff;"
    >
      <van-row type="flex" justify="space-between" class="title-bar">
        <van-col span="3" class="title-item">
          <van-icon name="arrow-left" @click="Back_page()" />
        </van-col>
        <van-col span="18" style="text-align: center;" class="title-item">{{
          flowerlabel
        }}</van-col>
        <van-col span="3"></van-col>
      </van-row>
      <div class="fimage">
        <van-row type="flex" justify="center">
          <van-image
            round
            width="120px"
            height="100px"
            v-bind:src="flowerImage"
            style="z-index:10;"
          />
        </van-row>
      </div>
    </div>
    <div style="text-align: center;">
      <van-row type="flex" justify="center">
        <van-col span="18">
          <div class="list-card">
            <van-list
              v-model="loading"
              :finished="finished"
              finished-text="没有更多了"
              @load="onLoad"
            >
              <van-cell
                v-for="item in list"
                :key="item"
                :title="item"
                @click="Go_page(item)"
              />
            </van-list>
          </div>
        </van-col>
      </van-row>
    </div>
  </div>
</template>

<style scoped lang="scss">
@import '../assets/styles/Category.scss';
</style>

<script>
export default {
  name: 'Category',
  data () {
    return {
      list: [],
      loading: false,
      finished: false,
      flowermeaning: null,
      flowerlabel: null,
      flowerImage: null
    }
  },
  created () {
    this.flowerlabel = this.$route.query.label
    this.axios.get('/getImage?label=' + this.flowerlabel).then(res => {
      this.flowerImage = res.data[0].image
      console.log(this.flowerImage)
    })
  },
  methods: {
    Go_page: function (label) {
      this.$router.push({
        path: '/detail',
        query: { label: label, flowerlabel: this.flowerlabel }
      })
    },
    Back_page: function () {
      this.$router.go(-1)
    },
    onLoad () {
      const bodyFormData = new FormData()
      bodyFormData.append('flower', this.flowerlabel)
      // 异步更新数据
      // setTimeout 仅做示例，真实场景中一般为 ajax 请求
      this.axios.post('/flowerspecies', bodyFormData).then(res => {
        console.log(res.data)
        for (let i = 0; i < res.data.length; i++) {
          this.list.push(res.data[i].name)
        }
        this.loading = false
        this.finished = true
      })
    }
  }
}
</script>
<style scoped>
.fimage {
  padding: 20px;
}
</style>
