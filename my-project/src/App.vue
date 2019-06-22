<template>
  <div id="app">
    <app-toolbar id="toolbar" class="fixed-top" v-if="!$store.state.isAdmin"></app-toolbar>
    <app-admin-toolbar id="toolbar" class="fixed-top" v-if="$store.state.isAdmin"></app-admin-toolbar>

    <router-view/>
    <footer>
      <app-footer></app-footer>
    </footer>
  </div>
</template>

<script>
import AppToolbar from "./components/ToolBar.vue";
import AppAdminToolbar from "./components/AdminToolBar.vue";
import AppFooter from "./components/Footer.vue";
export default {
  components: { AppToolbar, AppFooter, AppAdminToolbar },
  mounted() {
    if (localStorage.getItem("user-role") === "true") {
      this.$store.commit("adminStatus", true);
    } else {
      this.$store.commit("adminStatus", false);
    }
  }
};
</script>

<style>
html {
  overflow: auto;
  margin-top: 64px;
  height:100%;
}
body{ min-height:100%; padding:0; margin:0; position:relative; }

/* Trick: */
body {
  position: relative;
}

body::after {
  content: '';
  display: block;
  height: 150px; /* Set same as footer's height */
}

footer {
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 150px;
}
</style>
