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
  </div>
</template>
<script>
import AppSlide from "./Slide.vue";
export default {
  components: { AppSlide },
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
    };
  }
};
</script>
<style>
.toolbar {
  z-index: 999;
}
</style>


