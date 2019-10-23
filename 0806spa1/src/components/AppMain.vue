<template>
  <el-container class="main-container">
    <el-aside v-bind:class="asideClass">
      <LeftNav></LeftNav>
    </el-aside>
    <el-container>
      <el-header class="main-header">
        <TopNav></TopNav>
      </el-header>

      <div class="template-tabs">
        <el-tabs v-model="activeIndex" type="border-card" closable @tab-click="tabClick" @tab-remove="tabRemove">
          <el-tab-pane :key="item.name" v-for="(item, index) in options" :label="item.name" :name="item.route">
          </el-tab-pane>
        </el-tabs>
      </div>

      <el-main class="main-center">
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
  // 导入组件
  import TopNav from '@/components/TopNav.vue'
  import LeftNav from '@/components/LeftNav.vue'

  // 导出模块
  export default {
    data() {
      return {
        asideClass: 'main-aside',
        editableTabsValue: '',
        editableTabs: []
      }
    },
    components: {
      TopNav,
      LeftNav
    },
    created() {
      this.$root.Bus.$on("collapsed-side", (v) => {
        this.asideClass = v ? 'main-aside-collapsed' : 'main-aside';
      });
    },
    methods: {
      // tab切换时，动态的切换路由
      tabClick(tab) {
        let path = this.activeIndex;
        this.$router.push({
          path: path
        });
        this.$store.commit('set_role', "nopass");
      },
      tabRemove(targetName) {
        this.$store.commit('set_role', "nopass");
        // let tabs = this.editableTabs;
        this.$store.commit('delete_tabs', targetName);
        // 如果激活的关闭的tab就是激活的tab
        if (this.activeIndex === targetName) {
          // 设置当前激活的路由
          if (this.options && this.options.length >= 1) {
            this.$store.commit('set_active_index', this.options[this.options.length - 1].route);
            this.$router.push({
              path: this.activeIndex
            });
          } else {
            this.$router.push({
              path: '/AppMain'
            });
          }
        }
      }
    },
    watch: {
      '$route'(to) {
        let role = this.$store.state.role;
        let showName = this.$store.getters.getShowName
        let flag = false; //判断是否页面中是否已经存在该路由下的tab页
        //options记录当前页面中已存在的tab页
        for (let option of this.options) {
          //用名称匹配，如果存在即将对应的tab页设置为active显示桌面前端
          if (option.name === showName) {
            flag = true;
            this.$store.commit('set_active_index', to.path);
            break;
          }
        }
        //如果不存在，则新增tab页，再将新增的tab页设置为active显示在桌面前端
        // if(role!='nopass'){}
        if (role == 'pass') {
          if (!flag) {
            this.$store.commit('add_tabs', {
              route: to.path,
              name: showName
            });
            this.$store.commit('set_active_index', to.path);
          }
        }
      }
    },
    computed: {
      options() {
        return this.$store.state.options;
      },
      //动态设置及获取当前激活的tab页
      activeIndex: {
        get() {
          return this.$store.state.activeIndex;
        },
        set(val) {
          this.$store.commit('set_active_index', val);
        }
      }
    }
  };
</script>
<style type="text/css">
	.el-tabs--border-card>.el-tabs__content {
		padding: 0px;
	}
</style>
<style scoped>
  .main-container {
    height: 100%;
    width: 100%;
    box-sizing: border-box;
  }

  .main-aside-collapsed {
    /* 在CSS中，通过对某一样式声明! important ，可以更改默认的CSS样式优先级规则，使该条样式属性声明具有最高优先级 */
    width: 64px !important;
    height: 100%;
    background-color: #334157;
    margin: 0px;
  }

  .main-aside {
    width: 240px !important;
    height: 100%;
    background-color: #334157;
    margin: 0px;
  }

  .main-header,
  .main-center {
    padding: 0px;
    border-left: 2px solid #333;
  }
</style>
