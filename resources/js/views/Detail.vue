<template>
  <div>
    <img src="../assets/background-1.svg" alt="" class="background-img" />
    <div style="position: sticky; top: 0px; z-index:9999;">
      <van-row type="flex" justify="space-between" class="title-bar">
        <van-col span="3" class="title-item">
          <van-icon name="arrow-left" @click="Back_page()" />
        </van-col>
        <van-col span="18" style="text-align: center;" class="title-item"
          >商品詳情</van-col
        >
        <van-col span="3"></van-col>
      </van-row>
    </div>
    <div>
      <van-row type="flex" justify="center">
        <div style="position: absolute; top: 50px;">
          <van-image
            round
            width="90px"
            height="90px"
            v-bind:src="flowerImage"
            style="z-index:10;"
          />
        </div>
        <van-col span="22">
          <van-card class="product-card-title">
            <template #desc>
              <div class="product-card-text">
                <p class="product-card-name">
                  {{ labelname }} - {{ flowername }}
                </p>
                <!-- <p class="product-card-mean">代表熱情、熱戀、炙熱的愛</p>
              <van-tag round type="primary" class="product-card-tag">熱門花種</van-tag> -->
              </div>
              <van-row
                type="flex"
                justify="space-between"
                class="product-card-detail"
              >
                <van-col span="7">
                  <p>{{ flowerprice }}</p>
                  <p>平均成交價格</p>
                </van-col>
                <van-col span="7">
                  <p>1~3日</p>
                  <p>平均保存期限</p>
                </van-col>
                <van-col span="7">
                  <p>203</p>
                  <p>今日成交數量</p>
                </van-col>
              </van-row>
            </template>
          </van-card>
        </van-col>
      </van-row>
      <br />
      <br />
      <van-row type="flex" justify="center">
        <van-col span="22" class="product-body">
          <van-tabs v-model="activeName">
            <van-tab title="花語介紹" name="a">
              <div style="padding: 10px 0px 10px 0px">
                <van-card class="product-detail">
                  <template #desc>
                    <div v-for="item in description" :key="item.name">
                      <p class="product-title">
                        {{ labelname }} - {{ item.name }}:
                      </p>
                      <p class="product-text">{{ item.text }}</p>
                    </div>
                  </template>
                </van-card>
              </div>
            </van-tab>
          </van-tabs>
        </van-col>
      </van-row>
    </div>
  </div>
</template>

<style scoped lang="scss">
@import '../assets/styles/Detail.scss';
.background-img {
  position: absolute;
}
</style>

<script>
export default {
  name: 'Detail',
  data () {
    return {
      activeName: 'a',
      description: [],
      labelname: null,
      flowername: null,
      flowerprice: null,
      flowerImage: null
    }
  },
  created () {
    const str = this.$route.query.label.split('-')
    this.flowername = str[1]
    const str1 = this.$route.query.flowerlabel
    this.labelname = str1
  },
  mounted () {
    const bodyFormData = new FormData()
    console.log(this.flowername)
    console.log(this.labelname)
    bodyFormData.append('label', this.labelname)
    bodyFormData.append('color', this.flowername)
    this.axios.post('/flowermeaning', bodyFormData).then(res => {
      console.log(res.data)
      for (let i = 0; i < res.data.length; i++) {
        this.description.push({
          name: res.data[i].name,
          text: res.data[i].description
        })
        this.flowerImage = res.data[i].image
      }
      console.log(this.description)
    })
    const pricrdata = new FormData()
    const data = this.$route.query.label
    pricrdata.append('species', data)
    this.axios.post('/flowerArgPrice', pricrdata).then(res => {
      console.log(res.data)
      this.flowerprice = res.data
    })
  },
  methods: {
    Back_page: function () {
      this.$router.go(-1)
    }
  }
}
</script>
