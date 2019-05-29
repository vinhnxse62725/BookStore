<template>
  <div id="app">
    <app-toolbar class="toolbar fixed-top"></app-toolbar>
    <router-view/>
    <footer>
      <app-footer></app-footer>
    </footer>
  </div>
</template>

<script>
import AppToolbar from "./components/ToolBar.vue";
import AppFooter from "./components/Footer.vue";
export default {
  name: "App",
  components: { AppToolbar, AppFooter }
};
</script>

<style>
html {
  overflow: auto;
}
</style>
