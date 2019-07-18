<template>
  <v-container>
    <v-layout>
      <div style="margin:20px; width:100%; text-align: center;">
        <h2 class="font-weight-light">ORDER HISTORY</h2>
      </div>
    </v-layout>
    <v-data-table :headers="headers" :items="orderHistory" class="elevation-1">
      <template v-slot:items="props">
        <td class="text-md-center">{{ props.item.id }}</td>
        <td class="text-md-center">{{ props.item.orderdate }}</td>
        <td class="text-md-center">
          <span v-if="props.item.status">
            <v-icon color="green">check</v-icon>
          </span>
          <span v-if="!props.item.status">
            <v-icon color="red">close</v-icon>
          </span>
        </td>
        <td class="text-md-center">{{ props.item.total }} VNĐ</td>
        <td class="text-md-center">
          <v-btn flat fab small color="green" v-on:click="seeOrderDetail(props.item)">
            <v-icon>remove_red_eye</v-icon>
          </v-btn>
        </td>
      </template>
    </v-data-table>
    <v-bottom-sheet v-model="sheet">
      <template v-slot:activator>
        <v-btn flat fab small color="green" hidden id="bottom-sheet"></v-btn>
      </template>
      <v-list>
        <v-layout>
          <v-container>
            <div style="margin:20px; width:100%; text-align: center;">
              <h4>ORDER DETAIL (#{{orderID}})</h4>
            </div>
            <!-- <v-list-tile v-for="tile in tiles" :key="tile.title" @click="sheet = false"> -->
            <v-data-table
              loading="true"
              :headers="headersOrderDetails"
              :items="orderDetails"
              class="elevation-1"
              :pagination.sync="pagination"
              :rows-per-page-items="row_per_page_items"
            >
              <template v-slot:items="ods">
                <td class="text-md-center">{{ ods.item.book.id }}</td>
                <td class="text-md-center">
                  <img
                    :src="ods.item.book.image"
                    style="margin:10px; height: 70px;"
                  >
                </td>
                <td class="text-md-center">{{ ods.item.book.bookName }}</td>
                <td class="text-md-center">{{ ods.item.book.price }}</td>
                <td class="text-md-center">{{ ods.item.discount }}%</td>
                <td class="text-md-center">{{ ods.item.quantity }}</td>
                <td class="text-md-center">{{ ods.item.totalPrice }}</td>
              </template>
            </v-data-table>
            <div style="margin:20px; padding-right:20px; width:100%; text-align: right;">
              <h5>Total: {{total}} VNĐ</h5>
            </div>
          </v-container>
        </v-layout>
      </v-list>
    </v-bottom-sheet>
  </v-container>
</template>
<script>
export default {
  data() {
    return {
      row_per_page_items: [3, 5, 10],
      pagination: {
        rowsPerPage: 3
      },
      orderHistory: [],
      //Header of table
      headers: [
        { text: "Id", value: "id", align: "center" },
        { text: "Order date", value: "orderdate", align: "center" },
        { text: "Status", value: "status", align: "center" },
        { text: "Total", value: "total", align: "center" },
        { text: "Detail", value: "", align: "center" }
      ],
      headersOrderDetails: [
        { text: "Id", value: "id", align: "center" },
        { text: "Image", value: "image", align: "center" },
        { text: "Book Title", value: "bookName", align: "center" },
        { text: "Price", value: "price", align: "center" },
        { text: "Discount", value: "discount", align: "center" },
        { text: "Quantity", value: "quantity", align: "center" },
        { text: "Total", value: "totalPrice", align: "center" }
      ],
      total: 0,
      orderID: null,
      sheet: false,
      orderDetails: []
    };
  },
  methods: {
    seeOrderDetail(order) {
      this.orderID = order.id;
      this.total = order.total;
      this.$axios({
        method: "get",
        url: "api/orderdetail/" + this.orderID,
      })
        .then(rs => {
          // console.log(rs.data);
          this.orderDetails = rs.data;
        })
        .catch(er => {
          console.log(er);
        });
      document.getElementById("bottom-sheet").click();
    }
  },
  mounted() {
    var customer = JSON.parse(localStorage.getItem("profile"));
    var customerID = customer.id;
    this.$axios({
      method: "get",
      url: "api/order/userid/" + customerID,
    })
      .then(rs => {
        // console.log(rs.data);
        this.orderHistory = rs.data;
      })
      .catch(er => {
        console.log(er);
      });
  }
};
</script>

