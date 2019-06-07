<template>
  <div id="app">
    <app-toolbar id="toolbar" class="fixed-top"></app-toolbar>
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
  components: { AppToolbar, AppFooter }
};
</script>

<style>
html {
  overflow: auto;
  margin-top: 64px;
}
</style>
