<template>
  <v-layout wrap>
    <v-container>
      <form>
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
                  id="category"
                  v-model="bookDetail.category.id"
                  name="category"
                  v-validate="'required'"
                >
                  <option value disabled selected>Select Category</option>
                  <option
                    v-for="category in bookCategories"
                    :key="category.id"
                    v-if="category.id!=1"
                    :value="category.id"
                  >{{category.categoryName}}</option>
                </select>
                <p
                  class="help-block alert alert-danger animated bounceIn"
                  v-show="errors.has('status')"
                >{{errors.first('status')}}</p>
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
                  v-validate="'required|between:1,100'"
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
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="warning" @click="dialog = false">Close</v-btn>
            <v-btn color="success" @click="updateBook()">Update</v-btn>
          </v-card-actions>
        </v-container>
      </form>
    </v-container>
  </v-layout>
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
  methods: {
    updateBook() {
      this.$validator.validateAll().then(result => {
        if (result) {
          this.$axios({
            method: "put",
            url: "api/book/update/",
            withCredentials: true,
            data: {
              bookName: this.bookDetail.booktitle,
              description: this.bookDetail.description,
              status: this.bookDetail.status,
              price: this.bookDetail.price,
              image: this.bookDetail.image,
              quantity: this.bookDetail.quantity,
              discount: this.bookDetail.discount,
              category: {
                id: this.bookDetail.category.id
              }
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
                  url: "api/book",
                //   headers: {
                //     authorization: localStorage.getItem("access-token")
                //   }
                })
                  .then(rs => {
                    console.table(rs.data);
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
    let id = localStorage.getItem("editBookID");
    localStorage.removeItem("editBookID");
    this.$axios({
      method: "get",
      url: "api/book/getById",
    //   headers: {
    //     authorization: localStorage.getItem("access-token")
    //   },
      params: {
        id: id
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
select#category {
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

