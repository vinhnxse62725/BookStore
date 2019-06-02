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
                <label for="username"> 
                  <b>Tên đăng nhập</b> 
                </label> 
                <input type="text" placeholder="Nhập Username" v-model="username" name="username"> 
 
                <label for="password"> 
                  <b>Mật khẩu</b> 
                </label> 
                <input 
                  type="password" 
                  placeholder="Nhập Password" 
                  v-model="password" 
                  name="password" 
                > 
 
                <label for="repeatpassword"> 
                  <b>Xác nhận lại mật khẩu</b> 
                </label> 
                <input 
                  type="password" 
                  placeholder="Nhập lại Password" 
                  v-model="repeatpassword" 
                  name="repeatpassword" 
                > 
 
                <label for="fullname"> 
                  <b>Họ và tên</b> 
                </label> 
                <input type="text" placeholder="Nhập Họ và tên" v-model="fullname" name="fullname"> 
              </div> 
              <div class="col-md-6"> 
                <label for="gender"> 
                  <b>Giới tính</b> 
                </label> 
                <select class="form-control" id="gender" v-model="gender" name="gender"> 
                  <option>Male</option> 
                  <option>Female</option> 
                  <option>Other</option> 
                </select> 
 
                <label for="dob"> 
                  <b>Ngày sinh</b> 
                </label> 
                <!-- <input type="text" placeholder="Nhập Ngày sinh" name="dob" required> --> 
                <input type="date" v-model="dob" name="dob" min="1919-01-01" max="2100-01-01"> 
 
                <label for="address"> 
                  <b>Địa chỉ</b> 
                </label> 
                <input type="text" placeholder="Nhập Địa chỉ" v-model="address" name="address"> 
 
                <label for="phone"> 
                  <b>Số điện thoại</b> 
                </label> 
                <input type="text" placeholder="Nhập Số điện thoại" v-model="phone" name="phone"> 
              </div> 
            </div> 
            <div class="container"> 
              <label for="email"> 
                <b>Địa chỉ Email</b> 
              </label> 
              <input type="text" placeholder="Nhập Email" v-model="email" name="email"> 
            </div> 
            <button type="submit" v-on:click="getuser">Tạo Tài Khoản</button> 
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
      repeatpassword: "", 
      fullname: "", 
      gender: "", 
      dob: "", 
      address: "", 
      phone: "", 
      email: "" 
    }; 
  }, 
  headers: { 
    "Access-Control-Allow-Origin": "*", 
    "Content-Type": "application/json" 
  }, 
  methods: { 
    register() { 
      axios 
        .post("http://localhost:8090/auth/user/sign-up", { 
          username: this.username, 
          password: this.password, 
          repeatpassword: this.repeatpassword, 
          fullname: this.fullname, 
          gender: this.gender, 
          dob: this.dob, 
          address: this.address, 
          phone: this.phone, 
          email: this.email 
        }) 
        .then(res => { 
          alert("Registration completed successfully"); 
        }) 
        .catch(err => { 
          console.log(err); 
        }); 
    }, 
    getuser() { 
      axios 
        .get("${'https://cors-anywhere.herokuapp.com/'}http://localhost:8090/api/auth/user/1/",) 
        .then(res => { 
          alert("Registration completed successfully"); 
        }) 
        .catch(err => { 
          console.log(err); 
        }); 
    } 
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
  height: 800px; 
  background-image: url("../assets/loginbg.jpg"); 
  background-repeat: no-repeat; 
  background-position: center center; 
  background-size: cover; 
  position: relative; 
} 
 
.register { 
  width: 600px; 
  position: absolute; 
  top: 50%; 
  left: 50%; 
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
input[type="password"] { 
  width: 100%; 
  padding: 12px 20px; 
  margin: 8px 0; 
  display: inline-block; 
  border: 1px solid #ccc; 
  box-sizing: border-box; 
} 
input[type="date"] { 
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
input[type=date]::-webkit-inner-spin-button, /* up */  
input[type=date]::-webkit-outer-spin-button /* down */ { 
  margin: 12px; 
} 
 
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
 
