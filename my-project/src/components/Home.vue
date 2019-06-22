<template>
<v-app>
  <div>
    <div class="container">
      <app-slide></app-slide>
      <v-layout wrap style="margin-top:50px;">
        <!-- <div class="col-md-3" v-for="n  in 20 " :key="n"> -->
        <div class="col-md-3" v-for="product in $store.state.products">
          <single-product :product="product"></single-product>
        </div>
      </v-layout>
    </div>
    <div class="text-xs-center" style="margin-bottom: 50px">
      <v-pagination :length="6"></v-pagination>
    </div>
  </div>
  </v-app>
</template>
<script>
import AppSlide from "./Slide.vue";
import SingleProduct from "./SingleProduct.vue";
import axios from "axios";
export default {
  components: { AppSlide, SingleProduct },
  mounted() {
    this.$axios({
      method: "get",
      url: "api/book",
      headers: {
        authorization: localStorage.getItem("access-token")
      }
    }).then(rs => {
      this.$store.state.products = rs.data;
      console.table(rs.data);
    });
  }
};
</script>
<style scoped>
.toolbar {
  z-index: 999;
}
</style>


