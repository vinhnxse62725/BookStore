<template>
    <div class="bg">
      <div class="login">
        <form>
          <v-container v-on:keydown.enter.prevent="signin()">
            <h2>Login</h2>
            <div class="form-group">
              <label for="username">
                <b>Username</b>
              </label>
              <input
                type="text"
                placeholder="Type your Username"
                name="username"
                v-model="username"
                v-validate="'required|min:5'"
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
                placeholder="Type your password"
                name="password"
                v-model="password"
                v-validate="'required'"
              >
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('password')"
              >{{errors.first('password')}}</p>
            </div>
            <button type="button" v-on:click="signin()">Login</button>

            <div style="text-align:center;">
              <span class="psw">
                You don't have an account. 
                <router-link to="/register">Register now</router-link>
              </span>
            </div>
          </v-container>
        </form>
      </div>
    </div>
</template>
<script>
import axios from "axios";

export default {
  data() {
    return {
      username: "",
      password: ""
    };
  },
  methods: {
    signin() {
      this.$validator.validateAll().then(result => {
        if (result) {
          this.$axios({
            method: "post",
            url: "auth/login",
            data: {
              customerID: this.username,
              password: this.password
            }
          })
            .then(res => {
              console.log(res);
              var token = res.data;
              localStorage.setItem("access-token", token);
              this.$axios({
                method: "get",
                url: "auth/user/me",
                headers: {
                  authorization: localStorage.getItem("access-token")
                }
              }).then(rs => {
                console.log(rs);
                let profile = {
                  address: rs.data.address,
                  admin: rs.data.admin,
                  age: rs.data.age,
                  customerID: rs.data.customerID,
                  email: rs.data.email,
                  fullname: rs.data.fullname,
                  gender: rs.data.gender,
                  id: rs.data.id,
                  phone: rs.data.phone
                };
                console.log("++++++++++++++++++++++++++++++++++++++++++++");
                localStorage.setItem("profile", JSON.stringify(profile));
                localStorage.setItem("user-role", rs.data.admin);
                let isAdmin = rs.data.admin;
                localStorage.setItem("sign-in", true);
                localStorage.removeItem("sign-out");
                this.$store.commit("loginStatus", true);
                this.$store.commit("logoutStatus", false);
                // let something = JSON.parse(localStorage.getItem("profile"));
                // alert(something.email);
                this.$emit("logined", true);
                this.$swal({
                  title: "Success",
                  text:"Login successfully !",
                  type: "success",
                  confirmButtonText: "OK",
                  timer: 3000,
                  allowOutsideClick: false
                }).then(result => {
                    if (isAdmin) {
                      this.$store.commit("adminStatus", true);
                      this.$router.push("/admin");
                    } else {
                      this.$router.push("/");
                    }
                });
              });
            })
            .catch(er => {
              console.log(er);
              // alert("Wrong username or password!");
              this.$swal({
                title: "Error",
                text:"Wrong username or password !",
                type: "error",
                confirmButtonText: "OK",
                timer: 3000
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
@import "https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css";
/* input:valid {
  border-color: green !important;
  border: solid 2px;
}

input:invalid {
  border-color: red !important;
  border: solid 2px;
} */
.bg {
  width: 100%;
  height: 1000px;
  background-image: url("../assets/loginbg.jpg");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  position: relative;
}

.login {
  width: 450px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -70%);
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
input[type="password"] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
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
