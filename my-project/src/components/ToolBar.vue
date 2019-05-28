<template>
  <v-toolbar tabs>
    <!--Dropdown menu -->
    <v-menu transition="slide-x-transition" open-on-click offset-y offset-overflow class="menu">
      <v-toolbar-side-icon slot="activator"></v-toolbar-side-icon>
      <v-list class="list">
        <v-list-tile
          class="tile"
          v-for="category in categories"
          :key="category.name"
        >
          <router-link :to="category.router" exact class="activeRouter">
            <v-list-tile-title>{{category.name}}</v-list-tile-title>
          </router-link>
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
        { name: "Công nghệ", router: "/" },
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

.tile .activeRouter:hover {
  color: white;

}
.activeRouter{
  width: 100%;
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
</style>

