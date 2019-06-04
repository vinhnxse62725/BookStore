<template>
  <div>
    <!-- snackbar logout -->
    <v-snackbar
      v-if="$store.state.isSignOut"
      v-model="snackbarSignOut"
      :bottom="y === 'bottom'"
      :left="x === 'left'"
      :multi-line="mode === 'multi-line'"
      :right="x === 'right'"
      :timeout="timeout"
      :top="y === 'top'"
      :vertical="mode === 'vertical'"
    >
      {{ textSignOut }}
      <v-btn class="font-weight-bold" color="red" flat @click="snackbarSignOut = false">Close</v-btn>
    </v-snackbar>
    <!-- snackbar login -->
    <v-snackbar
      v-if="$store.state.isSignInMessage"
      v-model="snackbarSignIn"
      :bottom="y === 'bottom'"
      :left="x === 'left'"
      :multi-line="mode === 'multi-line'"
      :right="x === 'right'"
      :timeout="timeout"
      :top="y === 'top'"
      :vertical="mode === 'vertical'"
    >
      {{ textSignIn }}
      <v-btn class="font-weight-bold" color="red" flat @click="snackbarSignIn = false">Close</v-btn>
    </v-snackbar>
    <app-slide></app-slide>
    <div class="container">
      <v-layout wrap>
        <div class="col-md-3" v-for="n  in 20 " :key="n">
          <single-product :product="product"></single-product>
        </div>
      </v-layout>
    </div>
  </div>
</template>
<script>
import AppSlide from "./Slide.vue";
import SingleProduct from "./SingleProduct.vue";
export default {
  components: { AppSlide, SingleProduct },
  data() {
    return {
      snackbarSignOut: true,
      snackbarSignIn: true,
      y: "top",
      x: null,
      mode: "",
      timeout: 6000,
      textSignOut: "Logout Successfully",
      textSignIn: "Login Successfully",
      product: {
        img: "https://cdn.vuetifyjs.com/images/cards/desert.jpg",
        info:
          "Lorem ipsum dolor sit amet, brute iriure accusata ne mea. Eos suavitate referrentur ad, te duo agam libris qualisque, utroque quaestio accommodare no qui. Et percipit laboramus usu, no invidunt verterem nominati mel. Dolorem ancillae an mei, ut putant invenire splendide mel, ea nec propriae adipisci. Ignota salutandi accusamus in sed, et per malis fuisset, qui id ludus appareat.",
        title: "Kangaroo Valley Safari",
        price: "100,000,000 d",
        discount: "20%"
      }
    };
  }
};
</script>
<style>
.toolbar {
  z-index: 999;
}
</style>


