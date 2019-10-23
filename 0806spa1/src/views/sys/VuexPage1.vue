<template>
  <div>
    <h3 style="margin: 60px;">第一个Vuex页面:{{title}}</h3>
    <button @click="changeTitle">餐馆易主</button>
    <button @click="changeTitleAsync">两个月后餐馆易主</button>
    <button @click="doAjax">测试vuex使用ajax</button>
  </div>
</template>

<script>
  export default {
    data() {
      return {
          // title:''
      };
    },
    methods: {
      changeTitle() {
        this.$store.commit('setResturantName', {
          resturantName:'螺旋飞机鸡肉馆'
        });
      },
      changeTitleAsync(){
        this.$store.dispatch('setResturantNameAsync', {
          resturantName:'螺旋飞机鸭肉馆'
        });
      },
      doAjax(){
        this.$store.dispatch('doAjax', {
          _this:this
        });
      }
    },
    // created(){
    //   return this.$store.state.getResturantName;
    // }
    computed:{//必须用计算属性
      title(){
        // return this.$store.state.resturantName;
         return this.$store.getters.getResturantName;
      }
    }
  }
</script>

<style>
</style>
