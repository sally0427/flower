<template>
  <div class="home">
    <!-- <div class="search-field">
      <van-search
        v-model="value"
        placeholder="請輸入搜索花卉"
        background="#ff5a5f"
      />
    </div> -->
    <div class="nav-title">
      <p>花卉市場</p>
    </div>
    <div class="swiper">
      <van-swipe class="my-swipe" :autoplay="3000" indicator-color="white">
        <van-swipe-item class="van-swiper">
          <img src="../assets/images/banner.png" alt="" />
        </van-swipe-item>
      </van-swipe>
    </div>
    <div class="nav-sub-title">
      <p>
        <span>節日推薦</span>
      </p>
    </div>
    <div class="scroll-box">
      <img
        v-if="festivalLoading"
        src="../assets/images/loading.gif"
        alt=""
        class="loadingImg"
      />
      <div class="box-wrapper" v-else>
        <router-link
          :to="{ name: 'Festival', params: { name: festival } }"
          v-for="(festival, index) in hottestFestival"
          :key="index"
        >
          <div class="box">
            <p>{{ festival }}</p>
          </div>
        </router-link>
        <!-- <router-link to="/festival">
          <div class="box">
            <p>123</p>
          </div>
        </router-link> -->
        <!-- <div class="box"></div>
        <div class="box"></div>
        <div class="box"></div>
        <div class="box"></div> -->
      </div>
    </div>
    <div class="nav-sub-title">
      <p>
        <span>熱門花卉</span>
      </p>
    </div>
    <div class="flower-grid">
      <img
        v-if="isLoading"
        src="../assets/images/loading.gif"
        alt=""
        class="loadingImg"
      />

      <van-grid :column-num="3" clickable v-else>
        <van-grid-item
          v-for="(item, index) in hottestFlower"
          :key="index"
          :icon="item.img"
          :text="item.name"
          :to="{ path: '/category', query: { label: item.name } }"
        />
      </van-grid>
    </div>
    <div class="nav-sub-title">
      <p>
        <span>附近店家</span>
      </p>
    </div>
    <div class="stores-around">
      <van-button type="primary" block color="#ddeaf8" @click="findStore"
        >點我查找</van-button
      >
    </div>
    <!-- <van-tabbar>
      <van-tabbar-item icon="home-o">首頁</van-tabbar-item>
      <van-tabbar-item icon="search">搜尋</van-tabbar-item>
      <van-tabbar-item icon="setting-o">我的</van-tabbar-item>
    </van-tabbar> -->
  </div>
</template>

<script>
// @ is an alias to /src

export default {
  name: 'Home',
  data () {
    return {
      active: '0',
      value: '',
      hottestFlower: [],
      isLoading: true,
      festivalLoading: true,
      hottestFestival: [],
      newArray: []
    }
  },
  mounted () {
    this.axios.get('/hottestFlower').then(res => {
      const result = res.data.split(' ')
      result.pop()
      const promises = []
      for (var i = 0; i < result.length; i++) {
        promises.push(this.axios.get(`/getImage?label=${result[i]}`))
      }

      Promise.all(promises).then(responses => {
        const finalObj = []
        responses.forEach((item, index) => {
          var obj = {}
          obj.name = result[index]
          if (item.data.length !== 0) {
            obj.img = item.data[0].image
          } else {
            obj.img = require('../assets/images/default.jpeg')
          }
          finalObj.push(obj)
        })

        this.hottestFlower = finalObj
        this.isLoading = false
      })
    })
    this.axios.get('/upcomingfestival').then(res => {
      const festivalArr = res.data
      for (var i = 0; i < festivalArr.length; i++) {
        this.hottestFestival.push(festivalArr[i].name)
      }
      this.festivalLoading = false
      // console.log(result)
    })
  },
  //   https://www.youtube.com/watch?v=ID-_D0zJlSM&ab_channel=SoftAuthor
  // <a href="http://maps.google.com/maps?saddr=New+York&daddr=San+Francisco"
  //   >Route New York --> San Francisco</a
  // >
  methods: {
    findStore () {
      // if (navigator.geolocation) {
      //   navigator.geolocation.getCurrentPosition(
      //     position => {
      //       console.log(position.coords.latitude, position.coords.longitude)
      //     },
      //     error => {
      //       console.log(error)
      //     }
      //   )
      // }
      // console.log(1)
      window.location.href =
        'https://www.google.com.tw/maps/search/%E8%8A%B1%E5%BA%97'
    }
  }
}
</script>
<style lang="scss" scoped>
.van-swiper {
  img {
    height: 150px;
    width: 100%;
  }
}
.search-field {
  background-color: red;
}
.nav-title {
  background-color: hsl(358, 100%, 68%);
  padding: 10px 100px;

  p {
    text-align: center;
    font-size: 20px;
    font-weight: normal;
    color: white;
    // border-bottom: 1px solid #fff;
    padding: 10px 20px;
    position: relative;
    &::after {
      content: '';
      position: absolute;
      height: 2px;
      background: white;
      top: 100%;
      width: 20%;
      left: 50%;
      transform: translateX(-50%);
    }
  }
}
.swiper .van-swipe-item {
  color: #fff;
  font-size: 20px;
  // line-height: 150px;
  text-align: center;
  // background-color: #ffe4b8;
}
.nav-sub-title {
  p {
    text-align: center;
    font-size: 14px;
    font-weight: normal;
    opacity: 0.7;
    color: #202020;
    // border-bottom: 1px solid #fff;
    padding: 20px 30px;
    position: relative;
    background-color: #fff;
    z-index: 333;
    span {
      background-color: #fff;
      padding: 0 4px;
    }
    &::after {
      content: '';
      position: absolute;
      height: 2px;
      background: #202020;
      opacity: 0.7;
      top: 50%;
      width: 25%;
      left: 50%;
      transform: translate(-50%, -50%);
      pointer-events: none;
      z-index: -999;
    }
  }
}
.scroll-box {
  overflow: hidden;

  .box-wrapper {
    padding: 10px 0;
    white-space: nowrap; /*文本不会换行，文本会在在同一行上继续*/
    overflow-y: auto; /*可滑动*/
    height: 100%;
    background-color: #fff;
  }
  .box {
    width: 30%;
    margin-left: 3%;
    height: 150px;
    background: #fbe9ed;
    border-radius: 3px;
    box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 3px;
    display: inline-block; /*行内块元素*/
    position: relative;
    p {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      color: #f7c6d1;
      writing-mode: vertical-rl;
    }
  }
}
.flower-grid {
  padding: 30px;
  padding-top: 0;
  margin-bottom: 60px;
  text-align: center;
}
.loadingImg {
  width: 100px;
  height: 100px;
}
.scroll-box {
  text-align: center;
}
.stores-around {
  padding: 20px;
  .van-button__text {
    color: #5d6065;
  }
}
</style>
