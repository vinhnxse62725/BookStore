<template>
  <div class="card">
    <div class="card-body">
      <h2 class="card-title">Top 3 Selling Books In Month</h2>
    </div>

    <div class="card-img-bottom">
      <canvas id="fooCanvas" count="2" />

      <chartjs-bar
        v-for="(item, index) in books"
        :key="index"
        backgroundcolor="#de98ab"
        :beginzero="beginZero"
        :bind="true"
        bordercolor="#0c0306"
        :data="item.count"
        :datalabel="item.book.bookName"
        :labels="item.book.bookName"
        target="fooCanvas"
      />
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      beginZero: true,     
      // types: [
      //   {
      //     bgColor: "#de98ab",
      //     borderColor: "0c0306",
      //     // data: [1, 3, 5, 7, 2, 4, 6],
      //     // dataLabel: "Bar"
      //   }
      // ],
      books:[],
      labels:[],
      counts:[]
    };
  },
  mounted(){
      if(!localStorage.getItem("user-role")){
          this.$router.push("/page403");
      }
      this.$axios({
      method: "get",
      url: "api/order/orderbyMonth",
    })
      .then(rs => {
        console.log(rs.data[i].book.bookName);
        // for(let i=0; i<= rs.data.length;i++){
        //   this.labels.add(rs.data.book.bookName);
        //   this.counts.add(rs.data.count);
        // }
        alert(this.labels);
        alert(this.counts);
      })
      .catch(error => {
        console.log(error);
      })
  }
};
</script>