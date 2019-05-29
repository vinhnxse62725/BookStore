<template>
  <v-toolbar>
    <!--Dropdown menu -->
    <v-menu
      transition="slide-x-transition"
      open-on-click
      offset-y
      offset-overflow
      class="menu"
    >
      <v-toolbar-side-icon slot="activator"></v-toolbar-side-icon>
      <v-list class="list">
        <v-list-tile class="tile" v-for="category in categories" :key="category.name">
          <router-link :to="category.router" exact class="activeRouter">
            <v-list-tile-title>{{category.name}}</v-list-tile-title>
          </router-link>
        </v-list-tile>
      </v-list>
    </v-menu>

    <v-toolbar-title class="text-uppercase black--text">
      <router-link to="/" exact class="activeRouter">
        <span class="font-weight-light">Book</span>
        <span>Store</span>
      </router-link>
    </v-toolbar-title>
    <!-- 
    <v-toolbar-items class="hidden-sm-and-down">
      <v-btn flat>Type 1</v-btn>
      <v-btn flat>Type 2</v-btn>
    </v-toolbar-items>-->
    <v-spacer></v-spacer>
    <v-toolbar-items>
      <v-btn flat>
        <form action>
          <input type="search" placeholder="Nhập tên sách bạn cần tìm?">
          <v-icon class="searchIcon">search</v-icon>
        </form>
      </v-btn>
       <router-link to="/" tag="v-btn" class="v-btn--flat toolbar-btn">
        <div class="iconCart"><v-icon>shopping_cart</v-icon></div>
        <div class="txtCart">Cart</div>
      </router-link>
      <router-link to="/login" tag="v-btn" class="v-btn--flat toolbar-btn">
        <div class="iconLogin"><v-icon>fingerprint</v-icon></div>
        <div class="txtLogin">Login</div>
      </router-link>
    </v-toolbar-items>
  </v-toolbar>
</template>
<script>
export default {
  data() {
    return {
      categories: [
        { name: "Tất cả", router: "/" },
        { name: "Ẩm thực", router: "/" },
        { name: "Kỹ năng sống", router: "/" },
        { name: "Y học - Sức khỏe", router: "/" },
        { name: "Thể thao - Nghệ thuật", router: "/" },
        { name: "Trinh thám - Hình sự", router: "/" },
        { name: "Văn hóa - Tôn giáo", router: "/" },
        { name: "Tử vi - Phong thủy", router: "/" },
        { name: "Lịch sử - Chính trị", router: "/" },
        { name: "Văn học Việt Nam", router: "/" },
        { name: "Văn học nước ngoài", router: "/" },
        { name: "Hồi ký", router: "/" },
        { name: "Kinh dị - Ma quái", router: "/" },
        { name: "Cổ tích - Thần thoại", router: "/" },
        { name: "Khoa học - Công nghệ", router: "/" },
        { name: "Tiểu thuyết", router: "/" },
        { name: "Triết học", router: "/" },
        { name: "Kiếm hiệp", router: "/" },
        { name: "Truyện ngắn", router: "/" },
        // { name: "Truyện cười", router: "/" }
      ]
    };
  }
};
</script>
<style scoped>
.list {
  width: 400px;
}
.tile {
  float: left;
  width: 50%;
  background: white;
}
.activeRouter {
  color: black;
  text-decoration: none;
}

.tile:hover {
  background: grey;
}

.tile .activeRouter:hover {
  color: white;
}
.activeRouter {
  width: 100%;
}

/*Toolbar btn*/
.txtLogin {
  display: none;
}

.toolbar-btn:hover div.txtLogin {
  display: block;
}
.toolbar-btn:hover div.iconLogin {
   display: none;
}

.txtCart {
  display: none;
}

.toolbar-btn:hover div.txtCart {
  display: block;
}
.toolbar-btn:hover div.iconCart {
   display: none;
}
/* .menu .v-menu__content.theme--light.menuable__content__active {
    min-width: 400px !important; 
    top: 64px !important;
    left: 0px !important;
    z-index: 8 !important;
} */
@media screen and (min-width: 960px) {
  .menu .v-menu__content.theme--light {
    min-width: 400px !important;
    top: 64px !important;
    left: 0px !important;
    z-index: 999 !important;
    background: white !important;
  }
}
@media screen and (min-width: 648px) and (max-width: 960px) {
  .menu .v-menu__content.theme--light {
    min-width: 400px !important;
    top: 49px !important;
    left: 0px !important;
    z-index: 999 !important;
    background: white !important;
  }
}
@media screen and (max-width: 647px) {
  .menu .v-menu__content.theme--light {
    min-width: 400px !important;
    top: 56px !important;
    left: 0px !important;
    z-index: 999 !important;
    background: white !important;
  }
}

/* search bar*/
form {
  position: relative;
  transition: all 1s;
  width: 50px;
  height: 50px;
  background: white;
  box-sizing: border-box;
  border-radius: 25px;
  border: 4px solid white;
  padding: 5px;
}

input {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 42.5px;
  line-height: 30px;
  outline: 0;
  border: 0;
  display: none;
  font-size: 1em;
  border-radius: 20px;
  padding: 0 20px;
}

.searchIcon {
  box-sizing: border-box;
  padding: 10px;
  width: 42.5px;
  height: 42.5px;
  position: absolute;
  top: 0;
  right: 0;
  border-radius: 50%;
  color: grey;
  text-align: center;
  font-size: 2em;
  transition: all 1s;
}

form:hover {
  width: 300px;
  cursor: pointer;
}

form:hover input {
  display: block;
}

form:hover .fa {
  background: grey;
  color: white;
}
</style>

