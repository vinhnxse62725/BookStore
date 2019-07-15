<template>
  <v-card>
    <v-card-title>
      Users Manager
      <v-spacer></v-spacer>
      <v-text-field v-model="search" append-icon="search" label="Search" single-line hide-details></v-text-field>
      <!-- <v-spacer></v-spacer>
        <v-btn medium color="success">
          Create New Product
      </v-btn>-->
    </v-card-title>
    <v-data-table :headers="headers" :items="desserts" :search="search">
      <template v-slot:items="props">
        <td>{{ props.item.id }}</td>
        <td class="text-xs-center">{{ props.item.orderdate }}</td>
        <td class="text-xs-center">{{ props.item.total }}</td>
        <td class="text-xs-center">{{ props.item.status }}</td>
        <td class="text-xs-center">{{ props.item.user.customerID }}</td>
        <td class="text-xs-center">
          <v-btn fab small color="success" v-on:click="showOrderDetail(props.item)">
            <v-icon>remove_red_eye</v-icon>
          </v-btn>
          <v-btn fab small color="warning">
            <v-icon>edit</v-icon>
          </v-btn>
          <v-btn fab small color="error">
            <v-icon>clear</v-icon>
          </v-btn>
        </td>
      </template>
      <template v-slot:no-results>
        <v-alert
          :value="true"
          color="error"
          icon="warning"
        >Your search for "{{ search }}" found no results.</v-alert>
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
                  <img :src="ods.item.book.image" style="margin:10px; height: 70px;" />
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
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      search: "",
      headers: [
        { text: "Id", value: "id", align: "center" },
        { text: "Order date", value: "orderdate", align: "center" },
        { text: "Status", value: "status", align: "center" },
        { text: "Total", value: "total", align: "center" },
        { text: "CustomerID", value: "user", align: "center" },
        { text: "Action", value: "", align: "center" }
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
      orderDetails: [],
      sheet: false,
      total: 0,
      orderID: null,
      row_per_page_items: [3, 5, 10],
      pagination: {
        rowsPerPage: 3
      },
      desserts: []
    };
  },
  methods: {
    showOrderDetail(order) {
      this.orderID = order.id;
      this.total = order.total;
      
      this.$axios({
        method: "get",
        url: "api/orderdetail/" + order.id
      })
        .then(rs => {
          this.orderDetails = rs.data;
          document.getElementById("bottom-sheet").click();
        })
        .catch(er => {
          console.log(er);
        });
    }
  },
  mounted() {
    this.$axios({
      method: "get",
      url: "/api/order"
    })
      .then(rs => {
        console.table(rs.data);
        this.desserts = rs.data;
      })
      .catch(error => {
        console.log(error);
      });
  }
};
</script>