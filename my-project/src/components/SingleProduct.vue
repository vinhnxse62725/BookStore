<template>
  <v-layout justify-center mb-5>
    <!-- <v-flex> -->
      <v-badge color="orange" class="tool-tip">
        <template v-slot:badge>
          <span>-{{product.discount}}%</span>
        </template>
        <v-card>
          <v-img class="white--text" :aspect-ratio="195/300" :src="product.image" >
            <v-container fill-height fluid>
              <v-layout fill-height>
                <v-flex xs12 align-end flexbox>
                  <input type="hidden" id="product.id" value="product.id" />
                </v-flex>
              </v-layout>
            </v-container>
          </v-img>
          <v-card-title
            style="height: 50px; text-overflow: ellipsis; overflow: hidden;  width: 200px;"
          >
            <div>
              <h6 style="width:100%; text-align:center;">{{product.bookName}}</h6>
              <div class="tool-tip-text">
                <v-card style="min-width:200px; max-height:320px;">
                  <v-card-title>
                    <vue-custom-scrollbar class="scroll-area" :settings="settings">
                      <h6 style="width:100%; text-align:center">{{product.bookName}}</h6>
                      <br />
                      <p style="width:100%; text-align:initial;">{{product.description}}</p>
                    </vue-custom-scrollbar>
                  </v-card-title>
                </v-card>
              </div>
            </div>
          </v-card-title>
          <v-card-actions v-if="product.status">
            <div class="col-md-5">
              <span
                style="text-decoration: line-through;
                        font-size: 12px;
                        left: 22px;
                        position: absolute;
                        top: 8px;
                        width: 100%;"
              >{{product.price}} ₫</span>
              <br />
              <span
                style="color: red;
                        position: absolute;
                        top: -10px;
                        right: -22px;
                        width: 100%;"
              >{{priceAfterDiscount}} ₫</span>
            </div>
            <div class="col-md-7">
              <v-layout>
              <v-btn
                color="success"
                v-on:click="addToCard(product)"
              >Buy Now</v-btn>
              </v-layout>
            </div>
          </v-card-actions>
          <v-card-actions v-if="!product.status">
            <div class="col-md-5">
              <span
                style="text-decoration: line-through;
                        font-size: 12px;
                        left: 22px;
                        position: absolute;
                        top: 8px;
                        width: 100%;"
              >{{product.price}} ₫</span>
              <br />
              <span
                style="color: red;
                        position: absolute;
                        top: -10px;
                        right: -22px;
                        width: 100%;"
              >{{priceAfterDiscount}} ₫</span>
            </div>
            <div class="col-md-7">
              <v-layout block>
              <v-btn flat disabled>Out Stock</v-btn>
              </v-layout>
            </div>
          </v-card-actions>
        </v-card>
      </v-badge>
    <!-- </v-flex> -->
  </v-layout>
</template>
<script>
import VueCustomScrollbar from "vue-custom-scrollbar";
export default {
  props: ["product"],
  components: { VueCustomScrollbar },
  data() {
    return {
      cart: [],
      settings: {
        maxScrollbarLength: 60
      }
    };
  },
  methods: {
    addToCard(product) {
      var shoppingCartItems = [];

      if (localStorage.getItem("cart-storage") != null) {
        shoppingCartItems = JSON.parse(localStorage["cart-storage"].toString());
      }
      var id = this.product.id;
      var bookName = this.product.bookName;
      var image = this.product.image;
      var price = this.product.price;
      var discount = this.product.discount;
      var status = this.product.status;
      var quantity = 0;

      var item = {
        id: id,
        bookName: bookName,
        image: image,
        price: price,
        discount: discount,
        status: status,
        quantity: quantity
      };

      let selected = shoppingCartItems.find(
        cartItem => cartItem.id === item.id
      );
      selected = selected != undefined ? selected : item;
      selected.quantity++;

      shoppingCartItems = shoppingCartItems.filter(
        cartItem => cartItem.id !== item.id
      );
      shoppingCartItems.push(selected);

      localStorage.setItem("cart-storage", JSON.stringify(shoppingCartItems));
      this.$store.commit("updateCart", shoppingCartItems);
    }
  },
  computed: {
    priceAfterDiscount() {
      return (
        parseInt(this.product.price) -
        parseInt(this.product.price * (parseInt(this.product.discount) / 100))
      );
    }
  }
};
</script>
<style scoped>
.scroll-area {
  position: relative;
  margin: auto;
  min-width: 180px;
  max-height: 300px;
}
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

.tool-tip {
  position: relative;
  display: inline-block;
}

.tool-tip .tool-tip-text {
  visibility: hidden;
  width: 120px;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  z-index: 10;
  top: -5px;
  left: 105%;
}

.tool-tip:hover .tool-tip-text {
  visibility: visible;
}
</style>

