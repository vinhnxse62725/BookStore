<template>
  <div class="container">
    <v-layout>
      <div style="margin:20px; width:100%; text-align: center;">
        <h2 class="font-weight-light">GIỎ HÀNG</h2>
      </div>
    </v-layout>
    <v-data-table :headers="headers" :items="shoppingCartItems" class="elevation-1">
      <template v-slot:items="props">
        <td class="text-md-center">{{ props.item.id }}</td>
        <td class="text-md-center">
          <img :src="props.item.img" style="margin:10px; width: 100px;
    height: auto;">
        </td>
        <td class="text-md-center">{{ props.item.title }}</td>
        <td class="text-md-center">{{ props.item.price }}</td>
        <td class="text-md-center">
          <input
            type="number"
            step="1"
            max="99"
            min="1"
            :value="props.item.quantity"
            title="quantity"
            class="quantity"
            size="4"
          >
        </td>
        <td class="text-md-center">
          <v-btn flat fab small color="red">
            <v-icon>remove_shopping_cart</v-icon>
          </v-btn>
        </td>
      </template>
    </v-data-table>
    <div>
      <div style="margin:20px; width:100%; text-align: right;">
        <v-btn flat style="color:white; background-color:red;">Hủy Giỏ Hàng</v-btn>
        <v-btn flat style="color:white; background-color:green;">Thanh Toán Ngay</v-btn>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      shoppingCartItems: [],
      headers: [
        { text: "Id", value: "id", align: "center" },
        { text: "Image", value: "img", align: "center" },
        { text: "Title", value: "title", align: "center" },
        { text: "Price", value: "price", align: "center" },
        { text: "Quantity", value: "quantity", align: "center" },
        { text: "Remove", align: "center" }
      ]
    };
  },
  methods: {},
  mounted() {
    if (localStorage.getItem("cart-storage") != null) {
      this.shoppingCartItems = JSON.parse(
        localStorage["cart-storage"].toString()
      );
    }
  }
};
</script>
