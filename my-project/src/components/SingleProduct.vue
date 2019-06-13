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
          <v-card-title
            style="height: 50px; text-overflow: ellipsis; overflow: hidden;  width: 200px;"
          >
            <div>
              <h6>{{product.title}}</h6>
            </div>
          </v-card-title>
          <v-card-actions>
            <div class="col-md-5">
              <span
                style="text-decoration: line-through;
                        font-size: 12px;
                        left: 30px;
                        position: absolute;
                        top: 8px;"
              >{{product.price}}</span>
              <br>
              <span style="color: red;
                        position: absolute;
                        top: -10px;
                        right: -2px;">
                        {{product.price}}</span>
            </div>
            <div class="col-md-7">
              <v-btn flat color="success" v-on:click="addToCard(product)">Mua ngay</v-btn>
            </div>
          </v-card-actions>
        </v-card>
      </v-badge>
    </v-flex>
  </v-layout>
</template>
<script>
export default {
  props: ["product"],
  data() {
    return {
      cart: []
    };
  },
  methods: {
    addToCard(product) {
      var shoppingCartItems = [];

      if (localStorage.getItem("cart-storage") != null) {
        shoppingCartItems = JSON.parse(localStorage["cart-storage"].toString());
      }
      var id = this.product.id;
      var title = this.product.title;
      var img = this.product.img;
      var price = this.product.price;
      var quantity = 0;

      var item = {
        id: id,
        title: title,
        img: img,
        price: price,
        quantity: quantity
      };

      let selected = shoppingCartItems.find(cartItem => cartItem.id === item.id);
      selected = selected != undefined ? selected : item;
      selected.quantity++;

      shoppingCartItems = shoppingCartItems.filter(cartItem => cartItem.id !== item.id);
      shoppingCartItems.push(selected);

      localStorage.setItem("cart-storage", JSON.stringify(shoppingCartItems));
      this.$store.commit("updateCart", shoppingCartItems);
    }
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
>>> .child-flex > *,
.flex {
  padding-left: 15px;
  margin-bottom: 50px;
}
</style>

