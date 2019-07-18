<template>
  <v-layout wrap>
    <v-progress-linear
      :indeterminate="true"
      :active="loading"
      style="position:absolute; margin-top:0px;"
    ></v-progress-linear>
    <v-container>
      <v-container>
        <h2 style="text-align:center">Edit Book</h2>

        <v-container>
          <div class="form-group">
            <label for="Book Title">
              <b>Book Title</b>
            </label>
            <input
              type="text"
              placeholder="Type book title"
              v-model="bookDetail.bookName"
              name="title"
              v-validate="'required|min:1'"
            />
            <p
              class="help-block alert alert-danger animated bounceIn"
              v-show="errors.has('title')"
            >{{errors.first('title')}}</p>
          </div>
        </v-container>
        <div class="d-flex justify-content-center">
          <div class="col-md-6">
            <div class="form-group">
              <label for="Description">
                <b>Description</b>
              </label>
              <textarea
                rows="6"
                cols="34"
                type="text"
                placeholder="Type description"
                v-model="bookDetail.description"
                name="description"
              />
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('description')"
              >{{errors.first('description')}}</p>
            </div>
            <div class="form-group">
              <label for="URL Image">
                <b>URL Image</b>
              </label>
              <input
                type="text"
                placeholder="Input URL image"
                v-model="bookDetail.image"
                name="url_image"
                v-validate="'required'"
              />
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('url_image')"
              >{{errors.first('url_image')}}</p>
            </div>

            <div class="form-group">
              <label for="category">
                <b>Category</b>
              </label>
              <select
                class="form-control"
                id="cate"
                v-model="cateId"
                name="cate"
                v-validate="'required'"
              >
                <option disabled selected>Select Category</option>
                <option
                  v-for="(item, i) in bookCategories"
                  :key="i"
                  v-if="item.id!=1"
                  :value="item.id"
                >{{item.categoryName}}</option>
              </select>
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('cate')"
              >{{errors.first('cate')}}</p>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="Price">
                <b>Price</b>
              </label>
              <input
                type="number"
                placeholder="Type price"
                v-model="bookDetail.price"
                name="price"
                v-validate="'required|min:0'"
              />
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('price')"
              >{{errors.first('price')}}</p>
            </div>
            <div class="form-group">
              <label for="Discount">
                <b>Discount</b>
              </label>
              <input
                type="number"
                placeholder="Type % discount"
                v-model="bookDetail.discount"
                name="discount"
                v-validate="'required|between:0,100'"
              />
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('discount')"
              >{{errors.first('discount')}}</p>
            </div>
            <div class="form-group">
              <label for="Quantity">
                <b>Quantity</b>
              </label>
              <input
                type="number"
                placeholder="Type quantity"
                v-model="bookDetail.quantity"
                name="quantity"
                v-validate="'required|min:0'"
              />
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('quantity')"
              >{{errors.first('quantity')}}</p>
            </div>
            <div class="form-group">
              <label for="status">
                <b>Status</b>
              </label>
              <select
                class="form-control"
                id="status"
                v-model="bookDetail.status"
                name="status"
                v-validate="'required'"
              >
                <option value disabled selected>Select Status</option>
                <option value="true">Stocking</option>
                <option value="false">Out of Stock</option>
              </select>
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('status')"
              >{{errors.first('status')}}</p>
            </div>
          </div>
        </div>
        <v-layout justify-center block>
          <v-btn color="warning" @click="cancle()">Close</v-btn>
          <v-btn color="success" @click="updateBook()" :disabled="loading">Update</v-btn>
        </v-layout>
      </v-container>
    </v-container>
  </v-layout>
</template>
<script>
export default {
  data() {
    return {
      loading: true,
      id: null,
      bookDetail: [],
      bookCategories: [],
      cateId: 1
    };
  },
  methods: {
    cancle() {
      this.$router.push("/booksmanager");
    },
    updateBook() {
      this.$validator.validateAll().then(result => {
        if (result) {
          this.$axios
            .put("api/book/update/" + this.bookDetail.id, {
              bookName: this.bookDetail.bookName,
              description: this.bookDetail.description,
              status: this.bookDetail.status,
              price: this.bookDetail.price,
              image: this.bookDetail.image,
              quantity: this.bookDetail.quantity,
              discount: this.bookDetail.discount,
              category: {
                id: this.bookDetail.category.id
              }
            })
            .then(res => {
              this.$swal({
                title: "Success",
                text: "Update book successful !",
                type: "success",
                confirmButtonText: "OK",
                timer: 3000,
                allowOutsideClick: false
              }).then(result => {
                this.$axios({
                  method: "get",
                  url: "api/book"
                })
                  .then(rs => {
                    // console.table(rs.data);
                    this.desserts = rs.data;
                  })
                  .catch(error => {
                    console.log(error);
                  });
                this.$router.push("/booksmanager");
              });
            })
            .catch(er => {
              console.log(er);
              this.$swal({
                title: "Error!",
                text: "Something Wrong!",
                type: "error",
                confirmButtonText: "OK"
              });
            });
        } else {
          console.log("Not Valid");
        }
      });
    }
  },
  mounted() {
    let isAdmin = localStorage.getItem("user-role") === "true" ? true : false;
    if (!isAdmin) {
      this.$router.push("/page403");
    } else {
      let id = localStorage.getItem("editBookID");
      localStorage.removeItem("editBookID");
      this.$axios({
        method: "get",
        url: "api/book/getById",
        params: {
          id: id
        }
      })
        .then(rs => {
          this.bookDetail = rs.data;
          this.cateId = rs.data.category.id;
          this.loading = false;
        })
        .catch(error => {
          console.log(error);
        }),
        this.$axios({
          method: "get",
          url: "api/category"
        })
          .then(res => {
            this.bookCategories = res.data;
          })
          .catch(error => {
            console.log(error);
          });
    }
  }
};
</script>
<style scoped>
/* Full-width inputs */
input[type="text"],
input[type="password"],
input[type="number"],
textarea {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

select#status,
select#cate {
  width: 100%;
  height: 46px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
  background-color: transparent;
  border-radius: 0px;
}
</style>

