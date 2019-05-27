<template>
  <div>
      <app-toolbar class="toolbar"></app-toolbar>
    <div class="container carousel">
      <app-slide></app-slide>
    </div>
  </div>
</template>
<script>
import AppToolbar from "./ToolBar.vue";
import AppSlide from "./Slide.vue";
export default {
  components: { AppToolbar, AppSlide }
};
</script>
<style scoped>
.carousel{
  margin-top: 0px;
}
.toolbar{
  z-index: 1;
}
</style>


