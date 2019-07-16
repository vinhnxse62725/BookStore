<template>
  <v-card>
    <v-progress-linear
      :indeterminate="true"
      :active="loading"
      style="position:absolute; margin-top:0px;"
    ></v-progress-linear>
    <v-card-title>
      <div class="text-uppercase black--text" id="menulogo">
      <span class="font-weight-light" style="font-size: 20px;">Books</span>
      <span style="font-size: 20px;">Manager</span>
      </div >
      <v-spacer></v-spacer>
      <v-text-field v-model="search" append-icon="search" label="Search" single-line hide-details></v-text-field>
      <v-spacer></v-spacer>
      <v-dialog v-model="dialog" persistent max-width="600px">
        <template v-slot:activator="{ on }">
          <v-btn color="primary" dark v-on="on">Create New Product</v-btn>
        </template>
        <v-card>
          <vue-custom-scrollbar class="scroll-area" :settings="settings">
            <form>
              <v-container>
                <h2 style="text-align:center">Create New Product</h2>

                <v-container>
                  <div class="form-group">
                    <label for="Book Title">
                      <b>Book Title</b>
                    </label>
                    <input
                      type="text"
                      placeholder="Type book title"
                      v-model="booktitle"
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
                        v-model="description"
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
                        v-model="urlImage"
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
                        v-model="categoryID"
                        name="category"
                        v-validate="'required'"
                      >
                        <option value disabled selected>Select Category</option>
                        <option
                          v-for="category in this.categories"
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
                        v-model="price"
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
                        v-model="discount"
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
                        v-model="quantity"
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
                        v-model="status"
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
                  <v-btn color="success" @click="createNewBook()">Create</v-btn>
                </v-card-actions>
              </v-container>
            </form>
          </vue-custom-scrollbar>
        </v-card>
      </v-dialog>
    </v-card-title>
    <v-data-table :headers="headers" :items="desserts" :search="search">
      <template v-slot:items="props">
        <td>{{ props.item.id }}</td>
        <td class="text-xs-center">{{ props.item.bookName }}</td>
        <td class="text-xs-center">
          <img :src="props.item.image" style="margin:10px; width: 70px;
    height: auto;" />
        </td>
        <td class="text-xs-center">{{ props.item.discount }}</td>
        <td class="text-xs-center">{{ props.item.price }}</td>
        <td class="text-xs-center">{{ props.item.quantity }}</td>
        <td class="text-xs-center">{{ props.item.category.categoryName }}</td>
        <td class="text-xs-center">
          <v-icon v-if="props.item.status" color="green">done</v-icon>
          <v-icon v-if="!props.item.status" color="red">clear</v-icon>
        </td>
        <td class="text-xs-center">
          <v-layout block>
          <v-btn  fab small color="warning" @click="editBook(props.item.id)">
            <v-icon>edit</v-icon>
          </v-btn>
          <v-btn  fab small color="error" @click="removeBook(props.item.id)">
            <v-icon>clear</v-icon>
          </v-btn>
          </v-layout>
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
  </v-card>
</template>

<script>
import VueCustomScrollbar from "vue-custom-scrollbar";
export default {
  components: { VueCustomScrollbar },
  data() {
    return {
      loading: true,
      settings: {
        maxScrollbarLength: 60
      },
      dialog: false,
      search: "",
      headers: [
        {
          text: "Id",
          value: "id",
          align: "center"
        },
        {
          text: "Book Title",
          value: "bookName",
          align: "center"
        },
        { text: "Image", value: "image", align: "center" },
        { text: "Discount", value: "discount", align: "center" },
        { text: "Price", value: "price", align: "center" },
        { text: "Quantity", value: "quantity", align: "center" },
        { text: "Category", value: "category", align: "center" },
        { text: "Status", value: "status", align: "center" },
        { text: "Actions", align: "center", width: "15%" }
      ],
      desserts: [],
      categories: [],
      booktitle: null,
      description: null,
      urlImage: null,
      categoryID: null,
      price: null,
      discount: null,
      quantity: null,
      status: false
    };
  },
  methods: {
    createNewBook() {
      this.dialog = false;
      this.$validator.validateAll().then(result => {
        if (result) {
          this.$axios({
            method: "post",
            url: "api/book/",
            data: {
              bookName: this.booktitle,
              description: this.description,
              status: this.status,
              price: this.price,
              image: this.urlImage,
              quantity: this.quantity,
              discount: this.discount,
              category: {
                id: this.categoryID
              }
            }
          })
            .then(res => {
              this.$swal({
                title: "Success",
                text: "Create new book successful !",
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
    },
    removeBook(id) {
      this.$axios({
        method: "DELETE",
        url: "api/book/delete/",
        params: { id: id }
      })
        .then(res => {
          this.$swal({
            title: "Success",
            text: "Delete book successful !",
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
    },
    editBook(id) {
      localStorage.setItem("editBookID", id);
      this.$router.push("/editbook");
    }
  },
  mounted() {
    this.$axios({
      method: "get",
      url: "api/book"
    })
      .then(rs => {
        this.desserts = rs.data;
      })
      .catch(error => {
        console.log(error);
      }),
      this.$axios({
        method: "get",
        url: "api/category"
      })
        .then(res => {
          this.categories = res.data;
          this.loading = false;
        })
        .catch(error => {
          console.log(error);
        });
  }
};
</script>
<style scoped>
#menulogo{
    border: solid 2px;
    border-color: black;
    padding: 2px;
}
.scroll-area {
  position: relative;
  margin: auto;
  max-height: 600px;
}

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
