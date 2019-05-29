<template>
  <div class="bg">
    <div class="login">
      <form action="/">
        <div class="container">
          <h2>Đăng Nhập</h2>
          <label for="uname">
            <b>Tên đăng nhập</b>
          </label>
          <input type="text" placeholder="Nhập Username" name="uname" required>

          <label for="psw">
            <b>Mật khẩu</b>
          </label>
          <input type="password" placeholder="Nhập password" name="psw" required>
          <label>
            <input type="checkbox" checked="checked" name="remember"> Nhớ tài khoản
          </label>
          <button type="submit">Đăng Nhập</button>
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
