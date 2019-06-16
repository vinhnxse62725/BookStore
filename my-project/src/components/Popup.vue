<template>
  <div>
    <!-- snackbar logout -->
    <v-snackbar
      @logined="snackbarSignOut = $event"
      v-if="snackbarSignOut"
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
      @logined="snackbarSignIn = $event"
      v-if="this.snackbarSignIn"
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
  </div>
</template>
<script>
export default {
  data() {
    return {
      snackbarSignOut: false,
      snackbarSignIn: true,
      y: "top",
      x: null,
      mode: "",
      timeout: 6000,
      textSignOut: "Logout Successfully",
      textSignIn: "Login Successfully"
    };
  }
};
</script>

