<template>
  <el-menu router :default-active="$route.path"  class="el-menu-vertical-demo" background-color="#334157" text-color="#fff"
    active-text-color="#ffd04b" :collapse="collapsed">
    <!-- <el-menu default-active="2" :collapse="collapsed" collapse-transition router :default-active="$route.path" unique-opened class="el-menu-vertical-demo" background-color="#334157" text-color="#fff" active-text-color="#ffd04b"> -->
    <div class="logobox">
      <img class="logoimg" src="../assets/img/logo.png" alt="">
    </div>
    <!-- 注意：index是必填的属性    1、index可以看成ID，也就是说它是唯一的    2、它代表路由的跳转路径 -->
   <el-submenu :key="'id_'+m.treeNodeId" :index="'id_'+m.treeNodeId" v-for="m in menus">
     <template slot="title">
       <i :class="m.icon"></i>
       <span>{{m.treeNodeName}}</span>
     </template>
     <el-menu-item :key="'id_'+m2.treeNodeId" :index="m2.url" v-for="m2 in m.children">
       <template slot="title">
         <i :class="m2.icon"></i>
         <span>{{m2.treeNodeName}}</span>
       </template>
     </el-menu-item>
   </el-submenu>

  </el-menu>
</template>
<script>
  export default {
    data() {
      return {
        collapsed: false,
        menus:[],
        editableTabsValue: '2',
        tabIndex: 2
      }
    },
    created() {
      this.$root.Bus.$on("collapsed-side", (v) => {
        this.collapsed = v;
      });
      let url = this.axios.urls.SYSTEM_MENU_TREE;
      this.axios.post(url,{}).then((response) => {
          console.log(response);
          this.menus = response.data.result;
      }).catch((response) => {
        console.log(response);
      });
      },
      		methods:{
      			showName(name){
      				// 把菜单名称放进去，当成tab页的名称
      				this.$store.commit('set_showName', name)
      				this.$store.commit('set_role', "pass");
      			}
      		}
  }
</script>
<style>
  .el-menu-vertical-demo:not(.el-menu--collapse) {
    width: 240px;
    min-height: 400px;
  }

  .el-menu-vertical-demo:not(.el-menu--collapse) {
    border: none;
    text-align: left;
  }

  .el-menu-item-group__title {
    padding: 0px;
  }

  .el-menu-bg {
    background-color: #1f2d3d !important;
  }

  .el-menu {
    border: none;
  }

  .logobox {
    height: 40px;
    line-height: 40px;
    color: #9d9d9d;
    font-size: 20px;
    text-align: center;
    padding: 20px 0px;
  }

  .logoimg {
    height: 40px;
  }
</style>
