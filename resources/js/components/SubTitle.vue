<template>
  <div class="nav-sub-title">
    <p>
      <span>{{title}}</span>
    </p>
  </div>
</template>

<script>
export default {
  name: 'SubTitle',
  props: {
    title: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang='scss' scoped>
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
</style>
