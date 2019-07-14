<template>
  <h6>{{this.id}}</h6>
</template>
<script>
export default {
  data() {
    return {
      id: null,
      bookDetail: [],
      bookCategories: []
    };
  },
  mounted() {
    this.id = localStorage.getItem("editBookID");
    localStorage.removeItem("editBookID");
    this.$axios({
      method: "get",
      url: "api/book/getById",
      headers: {
        authorization: localStorage.getItem("access-token")
      },
      params: {
        id: this.id
      }
    })
      .then(rs => {
        console.table(rs.data);
        this.bookDetail = rs.data;
      })
      .catch(error => {
        console.log(error);
      }),
      this.$axios({
        method: "get",
        url: "api/category"
      })
        .then(res => {
          console.table(res.data);
          this.bookCategories = res.data;
        })
        .catch(error => {
          console.log(error);
        });
  }
};
</script>
