<template>
  <div>
    <div class="container">
      <app-slide></app-slide>
    </div>
  </div>
</template>
<script>
import AppSlide from "./Slide.vue";
export default {
  components: {AppSlide }
};
</script>
<style>
.toolbar{
  z-index: 999;
}
</style>


