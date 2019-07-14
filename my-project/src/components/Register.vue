<template>
    <div class="bg">
      <div id="register">
        <div class="register">
          <!-- <form v-on:summit.prevent="getuser"> -->
          <form>
            <v-container>
            <h2 style="text-align:center">Register</h2>
              <div class="d-flex justify-content-center">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="username">
                      <b>Username</b>
                    </label>
                    <input
                      type="text"
                      placeholder="Type your Username"
                      v-model="username"
                      name="username"
                      v-validate="'required|min:5|alpha_dash'"
                    >
                    <p
                      class="help-block alert alert-danger animated bounceIn"
                      v-show="errors.has('username')"
                    >{{errors.first('username')}}</p>
                  </div>

                  <div class="form-group">
                    <label for="password">
                      <b>Password</b>
                    </label>
                    <input
                      type="password"
                      placeholder="Type your Password"
                      v-model="password"
                      name="password"
                      v-validate="'required|min:6'"
                      ref="password"
                    >
                    <p
                      class="help-block alert alert-danger animated bounceIn"
                      v-show="errors.has('password')"
                    >{{errors.first('password')}}</p>
                  </div>
                  <div class="form-group">
                    <label for="password_confirmation">
                      <b>Confirm Password</b>
                    </label>
                    <input
                      type="password"
                      placeholder="Type your Confirm Password"
                      name="password_confirmation"
                      v-validate="'required|confirmed:password'"
                      data-vv-as="password"
                    >
                    <p
                      class="help-block alert alert-danger animated bounceIn"
                      v-show="errors.has('password_confirmation')"
                    >{{errors.first('password_confirmation')}}</p>
                  </div>
                  <div class="form-group">
                    <label for="fullname">
                      <b>Fullname</b>
                    </label>
                    <input
                      type="text"
                      placeholder="Type your Fullname"
                      v-model="fullname"
                      name="fullname"
                      v-validate="'required|alpha_spaces'"
                    >
                    <p
                      class="help-block alert alert-danger animated bounceIn"
                      v-show="errors.has('fullname')"
                    >{{errors.first('fullname')}}</p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="gender">
                      <b>Gender</b>
                    </label>
                    <select
                      class="form-control"
                      id="gender"
                      v-model="gender"
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
                  <div class="form-group">
                    <label for="age">
                      <b>Age</b>
                    </label>
                    <input
                      type="number"
                      v-model="age"
                      placeholder="Type your Age"
                      name="age"
                      v-validate="'required|between:1,100'"
                    >
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
                      v-model="address"
                      name="address"
                      v-validate="'required'"
                    >
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
                      v-model="phone"
                      name="phone"
                      v-validate="'required|digits:10'"
                    >
                    <p
                      class="help-block alert alert-danger animated bounceIn"
                      v-show="errors.has('phone')"
                    >{{errors.first('phone')}}</p>
                  </div>
                </div>
              </div>
              <v-container>
                <label for="email">
                  <b>Email</b>
                </label>
                <input
                  type="text"
                  placeholder="Type your Email"
                  v-model="email"
                  name="email"
                  v-validate="'required|email'"
                >
                <p
                  class="help-block alert alert-danger animated bounceIn"
                  v-show="errors.has('email')"
                >{{errors.first('email')}}</p>
              </v-container>
              <button type="button" v-on:click="signup()">Register</button>
            <div style="text-align:center;">
              <span class="psw">
                You have an account. 
                <router-link to="/login">Login now</router-link>
              </span>
            </div>
            </v-container>
          </form>
        </div>
      </div>
    </div>
</template>  
  
<script>
import axios from "axios";

export default {
  data() {
    return {
      username: "",
      password: "",
      fullname: "",
      gender: "",
      age: "",
      address: "",
      phone: "",
      email: ""
    };
  },
  methods: {
    signup() {
      this.$validator.validateAll().then(result => {
        if (result) {
          this.$axios({
            method: "post",
            url: "auth/sign-up/",
            data: {
              address: this.address,
              age: this.age,
              customerID: this.username,
              email: this.email,
              fullname: this.fullname,
              gender: this.gender,
              password: this.password,
              phone: this.phone
            }
          })
            .then(res => {
              // alert("Register Successfully!!");
              this.$swal({
                title: "Success",
                text:"Sign up successful !",
                type: "success",
                confirmButtonText: "OK",
                timer: 3000,
                allowOutsideClick: false
              }).then(result => {
                this.$router.push("/login");
              });
            })
            .catch(er => {
              console.log(er);
              this.$swal({
                title: "Error!",
                text:"Account already exists!",
                type: "error",
                confirmButtonText: "OK"
              });
            });
        } else {
          console.log("Not Valid");
        }
      });
    }
  }
};
</script>  
  
<style scoped>
.bg {
  width: 100%;
  height: 1200px;
  background-image: url("../assets/loginbg.jpg");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  position: relative;
}

.register {
  width: 900px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -70%);
  /* margin: -262px 0px 0px -292px; */
  background: rgba(255, 255, 255, 0.897);
  padding: 20px 20px;
  border-radius: 5px;
  box-shadow: -5px 5px 5px 5px rgba(0, 0, 0, 0.3),
    inset -5px 5px 5px rgba(255, 255, 255, 0.07);
}
form {
  border: 5px double #444444;
}
h2 {
  text-align: center;
}
/* Full-width inputs */
input[type="text"],
input[type="password"],
input[type="number"] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
/* input[type="date"] {
  padding-left: 10px;
  color: #707478;
  width: 100%;
  height: 46px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
  background-color: transparent;
  border-radius: 0px;
}
input[type=date]::-webkit-inner-spin-button, up  
input[type=date]::-webkit-outer-spin-button /* down */
/* {
  margin: 12px;
} */

select#gender {
  width: 100%;
  height: 46px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
  background-color: transparent;
  border-radius: 0px;
}
/* Set a style for all buttons */
button {
  background-color: #4caf50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

/* Add a hover effect for buttons */
button:hover {
  opacity: 0.8;
}

/* Add padding to containers */
.container {
  padding: 16px;
}
</style>  
 
