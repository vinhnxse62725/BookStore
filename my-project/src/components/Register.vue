<template>
  <div class="bg">
    <div class="login">
      <form action="/action_page.php">
        <div class="container">
          <h2>Tạo tài khoản</h2>
          <label for="uname">
            <b>Tên đăng nhập</b>
          </label>
          <input type="text" placeholder="Nhập Username" name="uname" required>

          <label for="psw">
            <b>Mật khẩu</b>
          </label>
          <input type="password" placeholder="Nhập Password" name="psw" required>

          <label for="re-psw">
            <b>Xác nhận lại mật khẩu</b>
          </label>
          <input type="password" placeholder="Nhập lại Password" name="re-psw" required>

          <label for="fullname">
            <b>Họ và tên</b>
          </label>
          <input type="text" placeholder="Nhập Họ và tên" name="fullname" required>

          <label for="gender">
            <b>Giới tính</b>
          </label>
          <input type="text" placeholder="Nhập Giới tính" name="gender" required>

          <label for="dob">
            <b>Ngày sinh</b>
          </label>
          <input type="text" placeholder="Nhập Ngày sinh" name="dob" required>

          <label for="adr">
            <b>Địa chỉ</b>
          </label>
          <input type="text" placeholder="Nhập Địa chỉ" name="adr" required>

          <label for="pn">
            <b>Số điện thoại</b>
          </label>
          <input type="text" placeholder="Nhập Số điện thoại" name="pn" required>

          <button type="submit">Tạo Tài Khoản</button>
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
