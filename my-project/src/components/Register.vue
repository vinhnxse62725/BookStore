<template>
  <div class="bg">
    <div id="register">
      <div class="register">
        <!-- <form v-on:summit.prevent="getuser"> -->
        <form>
          <h2 style="text-align:center">Tạo tài khoản</h2>
          <div class="container">
            <div class="d-flex justify-content-center">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="username">
                    <b>Tên đăng nhập</b>
                  </label>
                  <input
                    type="text"
                    placeholder="Nhập Username"
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
                    <b>Mật khẩu</b>
                  </label>
                  <input
                    type="password"
                    placeholder="Nhập Password"
                    v-model="password"
                    name="password"
                    v-validate="'required|min:6'"
                   ref="password">
                  <p
                    class="help-block alert alert-danger animated bounceIn"
                    v-show="errors.has('password')"
                  >{{errors.first('password')}}</p>
                </div>
                <div class="form-group">
                  <label for="password_confirmation">
                    <b>Xác nhận lại mật khẩu</b>
                  </label>
                  <input
                    type="password"
                    placeholder="Nhập lại Password"
                    name="password_confirmation"
                    v-model="password_confirmation"
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
                    <b>Họ và tên</b>
                  </label>
                  <input
                    type="text"
                    placeholder="Nhập Họ và tên"
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
                    <b>Giới tính</b>
                  </label>
                  <select
                    class="form-control"
                    id="gender"
                    v-model="gender"
                    name="gender"
                    v-validate="'required'"
                  >
                    <option value disabled selected>Chọn Giới Tính</option>
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
                    <b>Tuổi</b>
                  </label>
                  <!-- <input type="text" placeholder="Nhập Ngày sinh" name="dob" required> -->
                  <input
                    type="number"
                    v-model="age"
                    placeholder="Nhập Tuổi"
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
                    <b>Địa chỉ</b>
                  </label>
                  <input
                    type="text"
                    placeholder="Nhập Địa chỉ"
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
                    <b>Số điện thoại</b>
                  </label>
                  <input
                    type="text"
                    placeholder="Nhập Số điện thoại"
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
            <div class="container">
              <label for="email">
                <b>Địa chỉ Email</b>
              </label>
              <input
                type="text"
                placeholder="Nhập Email"
                v-model="email"
                name="email"
                v-validate="'required|email'"
              >
              <p
                class="help-block alert alert-danger animated bounceIn"
                v-show="errors.has('email')"
              >{{errors.first('email')}}</p>
            </div>
            <button type="button" v-on:click="signup()">Tạo Tài Khoản</button>
            <div style="text-align:center;">
              <span class="psw">
                Bạn đã có tài khoản.
                <router-link to="/login">Đăng nhập ngay</router-link>
              </span>
            </div>
          </div>
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
            // .post("/api/auth/user/sign-up/", {
            // .post("/auth/user/sign-up/", {
            //   address: this.address,
            //   age: this.age,
            //   customerID: this.username,
            //   email: this.email,
            //   fullname: this.fullname,
            //   gender: this.gender,
            //   password: this.password,
            //   phone: this.phone
            // })
            .then(res => {
              alert("Register Successfully!!");
              console.log(res);
              this.$router.push("/login");
            })
            .catch(er => {
              console.log(er);
            });
        } else {
          console.log("Not Valid");
        }
      });
    }
    // getuser() {
    //   // Tạo request lấy thông tin user với ID là 12345
    //   axios.defaults.headers.common["Access-Control-Allow-Origin"] = "*";
    //   axios
    //     .get(
    //       "/api/auth/user/1/"
    //       //, {
    //       //   withCredentials: false,
    //       //   headers: {
    //       //     "Content-Type": "application/json",
    //       //     // Authorization: "Bearer " + localStorage.token,
    //       //     "Access-Control-Allow-Origin": "*",
    //       //     Accept: "application/json, text/plain, */*",
    //       //     "Access-Control-Allow-Methods": "GET, PUT, POST, DELETE, OPTIONS",
    //       //     "Access-Control-Allow-Credentials": true
    //       //   }
    //       // }
    //     )
    //     .then(function(response) {
    //       // handle việc lấy dữ liệu thành công
    //       alert("success");
    //       console.log(response);
    //     })
    //     .catch(function(error) {
    //       // handle lỗi
    //       console.log(error);
    //     })
    //     .then(function() {
    //       // sau khi handle xong dữ liệu hoặc lỗi thì sẽ chạy tiếp code ở trong này.
    //     });
    // }
  }
};

// import {
//   required,
//   email,
//   minLength,
//   sameAs
// } from "vuelidate/lib/validators";

// export default {
//   data() {
//     return {
//       form: {
//         username: null,
//         fullname: null,
//         password: null,
//         repeatpassword: null,
//         gender: null,
//         dob: null,
//         address: null,
//         phone: null,
//         email: null
//       }
//     };
//   },
//   validations: {
//     form: {
//       name: {
//         required
//       },
//       fullname: {
//         required
//       },
//       password: {
//         required,
//         minLength: minLength(6)
//       },
//       repeatpassword: {
//         sameAsPassword: sameAs("password")
//       },
//       gender: {
//         required
//       },
//       dob: {
//         required
//       },
//       address: {
//         required
//       },
//       phone: {
//         required
//       },
//       email: {
//         required,
//         email
//       }
//     }
//   }
// };
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
  top: 32%;
  left: 45%;
  margin: -262px 0px 0px -292px;
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
 
