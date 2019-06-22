<template>
<v-app>
  <div class="container">
    <v-layout>
      <div style="margin:20px; width:100%; text-align: center;">
        <h2 class="font-weight-light">LỊCH SỬ ĐẶT HÀNG</h2>
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
              <h4>Thông Tin Đơn Hàng (#{{orderID}})</h4>
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
                    style="margin:10px; width: 100px;
    height: auto;"
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
              <h5>Tổng Cộng: {{total}} VNĐ</h5>
            </div>
          </v-container>
        </v-layout>
      </v-list>
    </v-bottom-sheet>
  </div>
  </v-app>
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
        { text: "Ngày Đặt", value: "orderdate", align: "center" },
        { text: "Trạng Thái", value: "status", align: "center" },
        { text: "Tổng Tiền", value: "total", align: "center" },
        { text: "Chi Tiết", value: "", align: "center" }
      ],
      headersOrderDetails: [
        { text: "Id", value: "id", align: "center" },
        { text: "Hình Ảnh", value: "image", align: "center" },
        { text: "Tiêu Đề", value: "bookName", align: "center" },
        { text: "Giá", value: "price", align: "center" },
        { text: "Giảm Giá", value: "discount", align: "center" },
        { text: "Số Lượng", value: "quantity", align: "center" },
        { text: "Tổng Tiền", value: "totalPrice", align: "center" }
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
        headers: {
          authorization: localStorage.getItem("access-token")
        }
      })
        .then(rs => {
          console.log(rs.data);
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
      headers: {
        authorization: localStorage.getItem("access-token")
      }
    })
      .then(rs => {
        console.log(rs.data);
        this.orderHistory = rs.data;
      })
      .catch(er => {
        console.log(er);
      });
  }
};
</script>

