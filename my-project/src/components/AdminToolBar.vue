<template>
  <v-toolbar dark>
    <v-spacer></v-spacer>
    <v-toolbar-title class="text-uppercase black--text">
      <router-link to="/admin" exact class="activeRouter">
        <span class="font-weight-light">Admin</span>
        <span>Page</span>
      </router-link>
    </v-toolbar-title>
    <v-spacer></v-spacer>
    <v-toolbar-items> 
      <router-link
        to="/login"
        tag="v-btn"
        class="v-btn--flat toolbar-btn"
        v-if="!$store.state.isSignIn"
      >
        <div class="iconLogin">
          <v-icon>fingerprint</v-icon>
        </div>
        <div class="txtLogin">Login</div>
      </router-link>
      <v-btn class="v-btn--flat toolbar-btn" v-on:click="logout()" v-if="$store.state.isSignIn">
        <div class="iconLogout">
          <v-icon>input</v-icon>
        </div>
        <div class="txtLogout" v-on:click="logout()">Logout</div>
      </v-btn>
    </v-toolbar-items>
  </v-toolbar>
</template>
<script>
export default {
  props: ["notification"],
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
        { name: "Truyện ngắn", router: "/" }
      ],
      // isAdmin: null,
      cart: null,
    };
  },
  mounted() {
    this.$store.commit(
      "updateCart",
      JSON.parse(localStorage.getItem("cart-storage"))
    );
  },
  methods: {
    logout() {
      localStorage.removeItem("access-token");
      localStorage.removeItem("profile");
      localStorage.removeItem("user-role");
      localStorage.removeItem("sign-in");
      this.$store.commit("loginStatus", false);
      this.$store.commit("adminStatus", false);
      this.$store.commit("logoutStatus", true);
      this.$store.commit("loginMessageStatus", false);
      this.$router.push("/");
    },
    changeSearchBar() {
      let searchbar = document.getElementById("form-search");
      if (searchbar.classList.contains("formclick")) {
        searchbar.classList.remove("formclick");
      } else {
        searchbar.classList.add("formclick");
      }
    }
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
  background:#212121;
}
.activeRouter {
  color: white;
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

/*Toolbar btn*/
.txtLogout {
  display: none;
}

.toolbar-btn:hover div.txtLogout {
  display: block;
}
.toolbar-btn:hover div.iconLogout {
  display: none;
}

/* .menu .v-menu__content.theme--light.menuable__content__active {
    min-width: 400px !important; 
    top: 64px !important;
    left: 0px !important;
    z-index: 8 !important;
} */

>>> .v-badge__badge {
  right: -18px;
}
@media screen and (min-width: 960px) {
  .menu .v-menu__content.theme--light {
    min-width: 400px !important;
    top: 64px !important;
    left: 0px !important;
    z-index: 999 !important;
    background: #212121 !important;
  }
}
@media screen and (min-width: 648px) and (max-width: 960px) {
  .menu .v-menu__content.theme--light {
    min-width: 400px !important;
    top: 49px !important;
    left: 0px !important;
    z-index: 999 !important;
    background: #212121 !important;
  }
}
@media screen and (max-width: 647px) {
  .menu .v-menu__content.theme--light {
    min-width: 400px !important;
    top: 56px !important;
    left: 0px !important;
    z-index: 999 !important;
    background: #212121 !important;
  }
}
</style>

