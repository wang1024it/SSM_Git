export default {
	setResturantNameAsync: (context, payload) => {
	  console.log('xxxx')
	  setTimeout(() => {
	    console.log('yyyy')
      // console.log(payload)//打印
	    context.commit('setResturantName', payload); //Action提交的是mutation
	  }, 3000);
	  console.log('zzzz')
	},
  doAjax:(context, payload) => {
     //vuex不能使用vue实例
     let _this = payload._this;
      let url = _this.axios.urls.SYSTEM_USER_DOLOGIN;
      console.log(url)
      _this.axios.post(url, {}).then((response) => {
        console.log('doAjax..........')
      	console.log(response);
      }).catch((response) => {
      	console.log(response);
      });
	}
}
