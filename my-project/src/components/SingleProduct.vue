<template>
  <v-layout>
    <v-flex>
      <v-card>
        <v-img class="white--text" height="200px" :src="product.img">
          <v-container fill-height fluid>
            <v-layout fill-height>
              <v-flex xs12 align-end flexbox>
                <span class="headline">{{product.title}}</span>
              </v-flex>
            </v-layout>
          </v-container>
        </v-img>
        <v-card-title>
          <div>
            <span>{{product.info}}</span>
          </div>
        </v-card-title>
        <v-card-actions>
          <v-btn flat color="orange">{{product.price}}</v-btn>
          <v-btn flat color="orange">{{product.discount}}</v-btn>
          <v-btn>Add to Cart</v-btn>
        </v-card-actions>
      </v-card>
    </v-flex>
  </v-layout>
</template>
<script>
export default {
  props: ["product"]
};
</script>
