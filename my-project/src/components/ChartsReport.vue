<template>
  <v-container>
    <v-layout wrap>
      <v-flex md12>
        <div style="text-align:center;">
          <h1 class="card-title">Statistical Books</h1>
        </div>
        <br />
      </v-flex>
      <v-flex md6>
        <div style="text-align:center;">
          <h3 class="card-title">Top 3 Selling Books In Month</h3>
        </div>
        <chartjs-doughnut
          :bind="true"
          :datasets="dataMonth"
          :labels="labelsMonth"
          :option="option"
        />
      </v-flex>
      <v-flex md6>
        <div style="text-align:center;">
          <h3 class="card-title">Top 3 Selling Books In Day</h3>
        </div>
        <chartjs-doughnut :bind="true" :datasets="dataDay" :labels="labelsDay" :option="option" />
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      dataMonth: [],
      dataDay: [],
      labelsMonth: [],
      labelsDay: [],
      option: {}
    };
  },
  mounted() {
    if (!localStorage.getItem("user-role")) {
      this.$router.push("/page403");
    }
    this.$axios({
      method: "get",
      url: "api/order/orderbyMonth"
    })
      .then(rs => {
        let result = rs.data;
        let counts = result.map(book => {
          return book.count;
        });
        this.dataMonth.push({
          data: counts,
          backgroundColor: ["#f36e60", "#ffdb3b", "#185190"],
          hoverBackgroundColor: ["#fbd2cd", "#fef5c9", "#d1e3f7"]
        });
        this.labelsMonth = result.map(book => {
          return book.book.bookName;
        });
      })
      .catch(error => {
        console.log(error);
      });
    /*Day top 3 */
    this.$axios({
      method: "get",
      url: "api/order/orderbyDay"
    })
      .then(rs => {
        let result = rs.data;
        let counts = result.map(book => {
          return book.count;
        });
        this.dataDay.push({
          data: counts,
          backgroundColor: ["#f36e60", "#ffdb3b", "#185190"],
          hoverBackgroundColor: ["#fbd2cd", "#fef5c9", "#d1e3f7"]
        });
        this.labelsDay = result.map(book => {
          return book.book.bookName;
        });
      })
      .catch(error => {
        console.log(error);
      });
  }
};
</script>