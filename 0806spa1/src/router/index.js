import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Login from '@/views/Login'
import Reg from '@/views/Reg'
import AppMain from '@/components/AppMain'
import Articles from '@/views/sys/Articles'
import VuexPage1 from '@/views/sys/VuexPage1'
import VuexPage2 from '@/views/sys/VuexPage2'
Vue.use(Router)

export default new Router({
  routes: [{
    path: '/',
    name: 'Login',
    component: Login
  }, {
    path: '/Login',
    name: 'Login',
    component: Login
  }, {
    path: '/Reg',
    name: 'Reg',
    component: Reg
  }, {
    path: '/AppMain',
    name: 'AppMain',
    component: AppMain,
    children: [{
        path: '/sys/Articles',
        name: 'Articles',
        component: Articles
      },
      {
        path: '/sys/VuexPage1',
        name: 'VuexPage1',
        component: VuexPage1
      },
      {
        path: '/sys/VuexPage2',
        name: 'VuexPage2',
        component: VuexPage2
      }
    ]
  }]
})
