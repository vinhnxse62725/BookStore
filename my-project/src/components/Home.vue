<template>
  <div>
    <app-toolbar></app-toolbar>
    <div class="container">
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

