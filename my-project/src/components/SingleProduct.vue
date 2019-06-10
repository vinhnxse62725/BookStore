<template>
  <v-layout>
    <v-flex>
      <v-badge color="orange">
        <template v-slot:badge>
          <span>-{{product.discount}}</span>
        </template>
        <v-card>
          <v-img class="white--text" style="max-width:100%; height:auto;" :src="product.img">
            <v-container fill-height fluid>
              <v-layout fill-height>
                <v-flex xs12 align-end flexbox>
                  <input type="hidden" id="product.id" value="product.id">
                </v-flex>
              </v-layout>
            </v-container>
          </v-img>
          <v-card-title style="height: 50px; text-overflow: ellipsis; overflow: hidden;  width: 200px;">
            <div>
              <h6>{{product.title}}</h6>
            </div>
          </v-card-title>
          <v-card-actions>
            <v-btn flat disabled>{{product.price}}</v-btn>
            <v-btn flat v-on:click="addToCard()">
              Mua ngay 
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-badge>
    </v-flex>
  </v-layout>
</template>
<script>
export default {
  props: ["product"],
  methods: {
    addToCard() {}
  }
};
</script>
<style scoped>
>>> .v-badge__badge {
  font-size: 16px;
  top: 10px;
  right: 10px;
  height: 40px;
  width: 40px;
}
>>> .child-flex>*, .flex{
  padding-left: 15px;
  margin-bottom: 50px;
}
</style>

