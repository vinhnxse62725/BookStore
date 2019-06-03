<template>
  <div class="bg">
    <div class="login">
      <form >
        <div class="container" v-on:keydown.enter.prevent="signin()">
          <h2>Đăng Nhập</h2>
          <label for="username">
            <b>Tên đăng nhập</b>
          </label>
          <input
            type="text"
            placeholder="Nhập Username"
            name="username"
            v-model="username"
            required
          >

          <label for="password">
            <b>Mật khẩu</b>
          </label>
          <input
            type="password"
            placeholder="Nhập password"
            name="password"
            v-model="password"
            required           
          >
          <label>
            <input type="checkbox" checked="checked" name="remember"> Nhớ tài khoản
          </label>
          <button type="button" v-on:click="signin()">Đăng Nhập</button>
          <div style="text-align:center;">
            <span class="psw">
              Bạn quên mật khẩu?
              <a href="#">Reset</a>
            </span>
          </div>

          <div style="text-align:center;">
            <span class="psw">
              Chưa có tài khoản
              <router-link to="/register">Đăng ký ngay</router-link>
            </span>
          </div>
        </div>
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
      axios.defaults.headers.common["Access-Control-Allow-Origin"] = "*";
      axios
        .post("/api/auth/login", {
          customerID: this.username,
          password: this.password
        })
        .then(res => {
          console.log(res);
          var token = res.headers.authorization;
          localStorage.setItem("access-token", token);
          axios
            .get("/api/auth/user/me", {
              headers: {
                authorization: localStorage.getItem("access-token")
              }
            })
            .then(rs => {
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
              localStorage.setItem("sign-in", true);
              localStorage.removeItem("sign-out");
              this.$store.commit('loginStatus', true);
              this.$store.commit('loginMessageStatus', true);
              this.$store.commit('logoutStatus', false); 
              // let something = JSON.parse(localStorage.getItem("profile"));
              // alert(something.email);
              this.$router.push("/");
            });
        })
        .catch(er => {
          console.log(er);
        });
    }
  }
};
</script>


<style scoped>
.bg {
  width: 100%;
  height: 800px;
  background-image: url("../assets/loginbg.jpg");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  position: relative;
}

.login {
  width: 310px;
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -184px 0px 0px -155px;
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
