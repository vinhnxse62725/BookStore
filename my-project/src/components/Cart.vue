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
            <img :src="props.item.image" style="margin:10px; width: 100px;
    height: auto;">
          </td>
          <td class="text-md-center">{{ props.item.bookName }}</td>
          <td class="text-md-center">{{ props.item.price }}</td>
          <td class="text-md-center">{{ props.item.discount }} %</td>
          <td class="text-md-center">
            <div class="cols-md-12">
              <v-btn flat fab small v-on:click="removeQuantity(props.item)">
                <v-icon>remove</v-icon>
              </v-btn>
              <input
                type="number"
                step="1"
                max="99"
                min="1"
                :value="props.item.quantity"
                title="quantity"
                class="quantity"
                style="width: 15px;"
                :id="props.item.id"
              >
              <v-btn flat fab small v-on:click="addQuantity(props.item)">
                <v-icon>add</v-icon>
              </v-btn>
            </div>
          </td>
          <td class="text-md-center">
            <v-btn flat fab small color="red" v-on:click="removeProduct(props.item)">
              <v-icon>remove_shopping_cart</v-icon>
            </v-btn>
          </td>
        </template>
      </v-data-table>
      <div v-if="shoppingCartItems.length > 0">
        <div style="margin:20px; padding-right:20px; width:100%; text-align: right;">
          <h5>Tổng Cộng: {{total}} VNĐ</h5>
        </div>
        <div style="margin:20px; width:100%; text-align: right;">
          <v-btn
            flat
            style="color:white; background-color:red;"
            v-on:click="cancelCart()"
          >Hủy Giỏ Hàng</v-btn>
          <v-btn
            flat
            style="color:white; background-color:green;"
            v-on:click="checkOut()"
          >Thanh Toán Ngay</v-btn>
        </div>
      </div>
    </div>
</template>
<script>
export default {
  data() {
    return {
      shoppingCartItems: [],
      //Header of table
      headers: [
        { text: "Id", value: "id", align: "center" },
        { text: "Hình Ảnh", value: "image", align: "center" },
        { text: "Tiêu Đề", value: "bookName", align: "center" },
        { text: "Giá", value: "price", align: "center" },
        { text: "Giảm Giá", value: "discount", align: "center" },
        { text: "Số Lượng", value: "quantity", align: "center" },
        { text: "Xóa", align: "center" }
      ],
      total: 0,
      signed_in: false
    };
  },
  methods: {
    addQuantity(product) {
      var id = window.document.getElementById(product.id);
      //set data item
      var item = {
        id: product.id,
        bookName: product.bookName,
        image: product.image,
        price: product.price,
        discount: product.discount,
        quantity: product.quantity
      };
      //get data item of cart from localStorage
      if (localStorage.getItem("cart-storage") != null) {
        this.shoppingCartItems = JSON.parse(
          localStorage["cart-storage"].toString()
        );
      }
      if (id.value < 99) {
        id.value = parseInt(id.value) + 1;

        item.quantity = id.value;

        //find item selected in data item
        let selected = this.shoppingCartItems.find(
          cartItem => cartItem.id === item.id
        );
        //set new quantity
        selected = selected != undefined ? selected : item;
        selected.quantity = item.quantity;

        //remove old selected item
        this.shoppingCartItems = this.shoppingCartItems.filter(
          cartItem => cartItem.id !== item.id
        );
        //update new data item
        this.shoppingCartItems.push(selected);
        //update data to localStorage
        localStorage.setItem(
          "cart-storage",
          JSON.stringify(this.shoppingCartItems)
        );
        this.$store.commit("updateCart", this.shoppingCartItems);
        this.total +=
          parseInt(product.price) -
          parseInt(product.price) * (parseInt(product.discount) / 100);
      }
    },
    removeQuantity(product) {
      var id = window.document.getElementById(product.id);
      //set data item
      var item = {
        id: product.id,
        bookName: product.bookName,
        image: product.image,
        price: product.price,
        discount: product.discount,
        quantity: product.quantity
      };
      //get data item of cart from localStorage
      if (localStorage.getItem("cart-storage") != null) {
        this.shoppingCartItems = JSON.parse(
          localStorage["cart-storage"].toString()
        );
      }
      if (id.value > 1) {
        id.value = parseInt(id.value) - 1;
        item.quantity = id.value;
        //find item selected in data item
        let selected = this.shoppingCartItems.find(
          cartItem => cartItem.id === item.id
        );
        //set new quantity
        selected = selected != undefined ? selected : item;
        selected.quantity = item.quantity;

        //remove old selected item
        this.shoppingCartItems = this.shoppingCartItems.filter(
          cartItem => cartItem.id !== item.id
        );
        //update new data item
        this.shoppingCartItems.push(selected);

        //update data to localStorage
        localStorage.setItem(
          "cart-storage",
          JSON.stringify(this.shoppingCartItems)
        );
        this.$store.commit("updateCart", this.shoppingCartItems);
        this.total -=
          parseInt(product.price) -
          parseInt(product.price) * (parseInt(product.discount) / 100);
      }
    },
    removeProduct(product) {
      var id = window.document.getElementById(product.id);
      //get data item of cart from localStorage
      if (localStorage.getItem("cart-storage") != null) {
        this.shoppingCartItems = JSON.parse(
          localStorage["cart-storage"].toString()
        );
      }
      //remove old selected item
      this.shoppingCartItems = this.shoppingCartItems.filter(
        cartItem => cartItem.id !== product.id
      );
      if (this.shoppingCartItems.length > 0) {
        //update data to localStorage
        localStorage.setItem(
          "cart-storage",
          JSON.stringify(this.shoppingCartItems)
        );
      } else {
        //remove data to localStorage
        localStorage.removeItem("cart-storage");
      }
      this.total -=
        (parseInt(product.price) -
          parseInt(product.price) * (parseInt(product.discount) / 100)) *
        parseInt(product.quantity);
      this.$store.commit("updateCart", this.shoppingCartItems);
    },
    cancelCart() {
      //remove data to localStorage
      localStorage.removeItem("cart-storage");
      this.shoppingCartItems = [];
      this.total = 0;
      this.$store.commit("updateCart", this.shoppingCartItems);
    },
    checkOut() {
      //Check Signed In
      if (!this.signed_in) {
        this.$swal({
          title: "Bạn cần đăng nhập để thanh toán!",
          type: "warning",
          confirmButtonText: "OK",
          timer: 3000
        });
        this.$router.push("/login");
      } else {
        //API Checkout
        var customer = JSON.parse(localStorage.getItem("profile"));
        var id = customer.id;
        var total = this.total;
        var status = true;

        //getCurrentTime
        var dateTime = new Date(
          new Date().getTime() - new Date().getTimezoneOffset() * 60000
        ).toISOString();

        this.$axios({
          method: "post",
          url: "api/order",
          headers: {
            authorization: localStorage.getItem("access-token")
          },
          data: {
            user: { id: id },
            total: total,
            status: status,
            orderdate: dateTime
          }
        })
          .then(rs => {
            var orderID = rs.data.id;
            for (
              let index = 0;
              index < this.shoppingCartItems.length;
              index++
            ) {
              var discount =
                parseInt(this.shoppingCartItems[index].discount) / 100;
              var quantity = parseInt(this.shoppingCartItems[index].quantity);
              var price = parseInt(this.shoppingCartItems[index].price);
              var priceAfterDiscount = price - price * discount;
              this.$axios({
                method: "post",
                url: "api/orderdetail",
                headers: {
                  authorization: localStorage.getItem("access-token")
                },
                data: {
                  order: {
                    id: orderID
                  },
                  book: {
                    id: this.shoppingCartItems[index].id
                  },
                  quantity: this.shoppingCartItems[index].id,
                  totalPrice: priceAfterDiscount * quantity,
                  discount: discount * 100
                }
              })
                .then(rs => {
                  console.log(rs);
                })
                .catch(er => {
                  console.log(er);
                });
            }
            this.$swal({
              title: "Thanh toán thành công!",
              type: "success",
              confirmButtonText: "OK",
              timer: 3000
            });
            localStorage.removeItem("cart-storage");
            this.$store.commit("updateCart", []);
            this.$router.push("/");
          })
          .catch(er => {
            console.log(er);
          });
      }
    }
  },
  mounted() {
    if (localStorage.getItem("cart-storage") != null) {
      this.shoppingCartItems = JSON.parse(
        localStorage["cart-storage"].toString()
      );
    }
    for (let index = 0; index < this.shoppingCartItems.length; index++) {
      var price = parseInt(this.shoppingCartItems[index].price);
      var discount = parseInt(this.shoppingCartItems[index].discount) / 100;
      var quantity = parseInt(this.shoppingCartItems[index].quantity);
      var priceAfterDiscount = price - price * discount;
      this.total += priceAfterDiscount * quantity;
    }
    this.signed_in = localStorage.getItem("sign-in");
  }
};
</script>
<style scoped>
/* Hide HTML5 Up and Down arrows. */
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

input[type="number"] {
  -moz-appearance: textfield;
}
</style>
