<template>
  <v-layout wrap>
    <v-progress-linear
      :indeterminate="true"
      :active="loading"
      style="position:absolute; margin-top:0px;"
    ></v-progress-linear>
    <v-container>
      <h2 style="text-align:center">Edit User Info</h2>
      <v-container>
        <div class="d-flex justify-content-center">
          <div class="col-md-6">
            <div class="form-group">
              <label for="username">
                <b>Username</b>
              </label>
              <input
                type="text"
                placeholder="Type your Username"
                v-model="user.customerID"
                name="username"
                v-validate="'required|min:5|alpha_dash'"
              />
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('username')"
              >{{errors.first('username')}}</p>
            </div>

            <div class="form-group">
              <label for="fullname">
                <b>Fullname</b>
              </label>
              <input
                type="text"
                placeholder="Type your Fullname"
                v-model="user.fullname"
                name="fullname"
                v-validate="'required|alpha_spaces'"
              />
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('fullname')"
              >{{errors.first('fullname')}}</p>
            </div>
            <div class="form-group">
              <label for="email">
                <b>Email</b>
              </label>
              <input
                type="text"
                placeholder="Type your Email"
                v-model="user.email"
                name="email"
                v-validate="'required|email'"
              />
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('email')"
              >{{errors.first('email')}}</p>
            </div>
            <div class="form-group">
              <label for="gender">
                <b>Gender</b>
              </label>
              <select
                class="form-control"
                id="gender"
                v-model="user.gender"
                name="gender"
                v-validate="'required'"
              >
                <option value disabled selected>Select your Gender</option>
                <option>Male</option>
                <option>Female</option>
                <option>Other</option>
              </select>
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('gender')"
              >{{errors.first('gender')}}</p>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="age">
                <b>Age</b>
              </label>
              <input
                type="number"
                v-model="user.age"
                placeholder="Type your Age"
                name="age"
                v-validate="'required|between:1,100'"
              />
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('age')"
              >{{errors.first('age')}}</p>
            </div>
            <div class="form-group">
              <label for="address">
                <b>Address (Shipping address)</b>
              </label>
              <input
                type="text"
                placeholder="Type your Address"
                v-model="user.address"
                name="address"
                v-validate="'required'"
              />
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('address')"
              >{{errors.first('address')}}</p>
            </div>
            <div class="form-group">
              <label for="phone">
                <b>Phone</b>
              </label>
              <input
                type="text"
                placeholder="Type your Phone"
                v-model="user.phone"
                name="phone"
                v-validate="'required|digits:10'"
              />
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('phone')"
              >{{errors.first('phone')}}</p>
            </div>
            <div class="form-group">
              <label for="role">
                <b>Role</b>
              </label>
              <select
                class="form-control"
                id="role"
                v-model="user.admin"
                name="role"
                v-validate="'required'"
              >
                <option value disabled selected>Select Role</option>
                <option value="true">Admin</option>
                <option value="false">User</option>
              </select>
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('role')"
              >{{errors.first('role')}}</p>
            </div>
          </div>
        </div>
      </v-container>
      <v-layout justify-center block>
        <v-btn color="warning" type="button" @click="cancle()">Cancel</v-btn>
        <v-btn color="primary" type="button" @click="updateUserInfo()" :disabled="loading">Update</v-btn>
      </v-layout>
    </v-container>
  </v-layout>
</template>
<script>
export default {
  data() {
    return {
      loading: true,
      id: null,
      user: []
    };
  },
  methods: {
    cancle() {
      this.$router.push("/usersmanager");
    },
    updateUserInfo() {
      this.$validator.validateAll().then(result => {
        if (result) {
          console.table(this.user);
          this.$axios
            .put("auth/user/" + this.user.id, {
              email: this.user.email,
              fullname: this.user.fullname,
              gender: this.user.gender,
              age: this.user.age,
              phone: this.user.phone,
              address: this.user.address,
              admin: this.user.admin
            })
            .then(res => {
              this.$swal({
                title: "Success",
                text: "Update User successful !",
                type: "success",
                confirmButtonText: "OK",
                timer: 3000,
                allowOutsideClick: false
              }).then(result => {
                this.$axios({
                  method: "get",
                  url: "auth/user/getAll"
                })
                  .then(rs => {
                    // console.table(rs.data);
                    this.desserts = rs.data;
                    this.loading = false;
                  })
                  .catch(error => {
                    console.log(error);
                  });
                this.$router.push("/usersmanager");
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
    let id = localStorage.getItem("editUserID");
    localStorage.removeItem("editUserID");
    this.$axios({
      method: "get",
      url: "auth/user/" + id
    })
      .then(rs => {
        console.table(rs.data);
        this.user = rs.data;
        this.loading = false;
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

select#gender,
select#role {
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

