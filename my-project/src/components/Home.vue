<template>
  <div>
    <v-container style="width:70% !important;">
      <br />
      <app-slide></app-slide>
      <v-layout wrap style="margin-top:50px;">
        <v-flex lg3 md4 sm6 wrap v-for="product in $store.getters.getPaginationProducts" :key="product.id">
          <single-product :product="product"></single-product>
        </v-flex>
      </v-layout>
    </v-container>
    <div class="text-xs-center" style="margin-bottom: 50px">
      <v-pagination
        v-model="$store.state.currentPage"
        :length="$store.state.totalPages"
        :total-visible="7"
        @input="onClickPage"
        @next="onClickNextPage"
        @previous="onClickPreviousPage"
        next=":disabled='isInLastPage'"
        previous=":disabled='isInFirstPage'"
      ></v-pagination>
    </div>
    <br />
  </div>
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
    }).then(rs => {
      this.$store.commit("setPaginationData", rs.data);
    });
  },
  computed: {
    isInFirstPage() {
      return this.$store.state.currentPage === 1;
    },
    isInLastPage() {
      return this.$store.state.currentPage === this.$store.state.totalPages;
    }
  },
  methods: {
    onClickPreviousPage() {
      // this.$emit('pagechanged', this.currentPage - 1);
      this.$store.commit("setPrevSelectedPage", null);
    },
    onClickPage(selectedPage) {
      // this.$emit('pagechanged', currentPage);
      this.$store.commit("setCurrentSelectedPage", selectedPage);
    },
    onClickNextPage() {
      // this.$emit('pagechanged', this.currentPage + 1);
      this.$store.commit("setNextSelectedPage", null);
    }
  }
};
</script>
<style scoped>
.toolbar {
  z-index: 999;
}
</style>


