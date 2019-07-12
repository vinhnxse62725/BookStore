<template>
  <v-app>
      <app-toolbar id="toolbar" v-if="!$store.state.isAdmin"></app-toolbar>
      <!-- <app-admin-toolbar id="toolbar" class="fixed-top" v-if="$store.state.isAdmin"></app-admin-toolbar> -->
      <app-admin-toolbar v-if="$store.state.isAdmin"></app-admin-toolbar>
    <router-view />
    <br />
    <br />
    <app-footer></app-footer>
  </v-app>
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
