<template>
  <v-toolbar>
    <!--Dropdown menu -->
    <v-menu
      transition="slide-x-transition"
      open-on-click
      close-on-click="true"
      offset-y
      offset-overflow
      class="menu"
    >
      <v-toolbar-side-icon slot="activator"></v-toolbar-side-icon>
      <v-list class="list">
        <v-list-tile
          class="tile"
          v-for="category in categories"
          :key="category.name"
          router
          :to="category.router"
          :exact-active-class="activeRouter"
        >
          <!-- <router-link :to="category.router" exact class="router"> -->
          <v-list-tile-title>{{category.name}}</v-list-tile-title>
          <!-- </router-link> -->
        </v-list-tile>
      </v-list>
    </v-menu>

    <v-toolbar-title class="text-uppercase black--text">
      <span class="font-weight-light">Book</span>
      <span>Store</span>
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
      <v-btn flat>
        <span>
          <v-icon>shopping_cart</v-icon>
        </span>
      </v-btn>
      <v-btn flat>
        <v-icon>fingerprint</v-icon>Login
      </v-btn>
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
        { name: "Truyện cười", router: "/" }
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

.tile .activeRouter {
  color: white;
}
a.activeRouter.v-list__tile--active.primary--text.v-list__tile--active.v-list__tile.v-list__tile--link.theme--light {
  text-decoration: none !important;
}

a.activeRouter.v-list__tile--active.primary--text.v-list__tile--active.v-list__tile.v-list__tile--link.theme--light:hover {
  color: white !important;
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
  }
}
@media screen and (min-width: 648px) and (max-width: 960px) {
  .menu .v-menu__content.theme--light {
    min-width: 400px !important;
    top: 49px !important;
    left: 0px !important;
    z-index: 999 !important;
  }
}
@media screen and (max-width: 647px) {
  .menu .v-menu__content.theme--light {
    min-width: 400px !important;
    top: 56px !important;
    left: 0px !important;
    z-index: 999 !important;
  }
}
/* search bar*/
form{
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

input{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;;
    height: 42.5px;
    line-height: 30px;
    outline: 0;
    border: 0;
    display: none;
    font-size: 1em;
    border-radius: 20px;
    padding: 0 20px;
}

.searchIcon{
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

form:hover{
    width: 300px;
    cursor: pointer;
}

form:hover input{
    display: block;
}

form:hover .fa{
    background: grey;
    color: white;
} 
</style>

