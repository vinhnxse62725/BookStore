<template>
  <div> 
    <div class="container">
      <app-slide></app-slide>
      <v-layout wrap style="margin-top:50px;">
        <!-- <div class="col-md-3" v-for="n  in 20 " :key="n"> -->
        <div class="col-md-3" v-for="product in products">
          <single-product :product="product"></single-product>
        </div>
      </v-layout>
    </div>
    <div class="text-xs-center" style="margin-bottom: 50px">
      <v-pagination  :length="6"></v-pagination>
    </div>
  </div>
</template>
<script>
import AppSlide from "./Slide.vue";
import SingleProduct from "./SingleProduct.vue";
import axios from "axios";
export default {
  components: { AppSlide, SingleProduct },
  data() {
    return {
      products: []
    };
  },
  created(){
              this.$axios({
                method: "get",
                url: "api/book",
                headers: {
                  authorization: localStorage.getItem("access-token")
                }
              }).then(rs => {
                console.log(rs);
                this.products = rs.data;
              });
  }
};
</script>
<style scoped>
.toolbar {
  z-index: 999;
}
</style>


