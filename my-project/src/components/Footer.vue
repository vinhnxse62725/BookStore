<template>
  <div class="footer">
    <div class="container">
      <div class="d-flex justify-content-center">
        <div class="col-md-3">
          <div class="line text-uppercase white--text" style="text-align:center">
            <span class="font-weight-light logo1">Book</span>
            <span class="logo2">Store</span>
            <br>
            <span class="font-weight-light contact">CONTACT</span>
          </div>
        </div>
        <div class="col-md-6">
          <div style=" text-align:left;">
            <p>
              <v-icon style="color:white;">phone</v-icon>Phone: 0356604104
            </p>
            <p>
              <v-icon style="color:white;">location_on</v-icon>Address: Công viên phần mềm Quang Trung, Quận 12, TP.Hồ Chí Minh
            </p>
            <p>
              <v-icon style="color:white;">email</v-icon>Email: Bookstore@gmail.com
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.footer {
  width: 100%;
  height: 150px;
  background-color: #282d33;
  color: white;
}
.contact {
  margin-right: -82px;
  font-size: large;
}
.text-center {
  text-align: center;
}
.logo1 {
  font-size: 2em;
}
.logo2 {
  font-size: 2em;
}
@media screen and (min-width: 648px) and (max-width: 991px) {
 .contact{
   margin-right: -64px;
    font-size: medium;
 }
 .logo1 {
  font-size: 1.7em;
}
.logo2 {
  font-size: 1.7em;
}
}
</style>