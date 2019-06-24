<template>
  <v-toolbar>
    <!--Dropdown menu -->
    <v-menu transition="slide-x-transition" open-on-click offset-y offset-overflow class="menu">
      <v-toolbar-side-icon slot="activator"></v-toolbar-side-icon>
      <v-list class="list">
        <v-list-tile class="tile" v-for="category in categories" :key="category.name">
          <v-btn @click="categorySelected(category.id)" class="activeRouter">
            <v-list-tile-title>{{category.categoryName}}</v-list-tile-title>
          </v-btn>
        </v-list-tile>
      </v-list>
    </v-menu>

    <v-toolbar-title class="text-uppercase black--text">
      <router-link to="/" exact class="activeRouter">
        <span class="font-weight-light">Book</span>
        <span>Store</span>
      </router-link>
    </v-toolbar-title>
    <v-spacer></v-spacer>
    <v-toolbar-items>
      <v-btn flat>
        <form id="form-search" @submit.prevent="" >
          <input
            type="text"
            placeholder="Nhập tên sách bạn cần tìm?"
            v-model="searchValue"
            v-on:keydown.enter="search()"
          >
          <v-icon class="searchIcon" @click="changeSearchBar()">search</v-icon>
        </form>
      </v-btn>
      <router-link to="/cart" tag="v-btn" class="v-btn--flat toolbar-btn">
        <div class="iconCart">
          <v-badge color="grey">
            <template v-slot:badge>
              <span>{{$store.state.cart == undefined ? 0 : $store.state.cart.length}}</span>
            </template>
            <v-icon medium color="black">shopping_cart</v-icon>
          </v-badge>
        </div>
        <div class="txtCart">Giỏ Hàng</div>
      </router-link>
      <router-link
        to="/history"
        tag="v-btn"
        class="v-btn--flat toolbar-btn"
        v-if="$store.state.isSignIn"
      >
        <div class="iconHistory">
          <v-icon medium color="black">history</v-icon>
        </div>
        <div class="txtHistory">Lịch Sử</div>
      </router-link>
      <router-link
        to="/login"
        tag="v-btn"
        class="v-btn--flat toolbar-btn"
        v-if="!$store.state.isSignIn"
      >
        <div class="iconLogin">
          <v-icon>fingerprint</v-icon>
        </div>
        <div class="txtLogin">Đăng Nhập</div>
      </router-link>
      <v-btn class="v-btn--flat toolbar-btn" v-on:click="logout()" v-if="$store.state.isSignIn">
        <div class="iconLogout">
          <v-icon>input</v-icon>
        </div>
        <div class="txtLogout" v-on:click="logout()">Đăng Xuất</div>
      </v-btn>
    </v-toolbar-items>
  </v-toolbar>
</template>
<script>
import { eventBus } from "../main";
export default {
  props: ["notification"],
  data() {
    return {
      categories: [],
      searchValue: null,
      // isAdmin: null,
      cart: null
    };
  },
  mounted() {
    this.$store.commit(
      "updateCart",
      JSON.parse(localStorage.getItem("cart-storage"))
    );
  },
  methods: {
    categorySelected(id) {
      this.$axios({
        method: "get",
        url: "api/book/searchByCategoryId",
        params: {
          searchValue: this.$store.state.searchValue,
          cateId: id,
        }
      })
        .then(res => {
          this.$store.commit("setCateId", id);
          this.$store.commit("setPaginationData", res.data);
        })
        .catch(er => {
          console.log(er);
        });
    },
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
    },
    search() {
      this.$axios({
        method: "get",
        url: "api/book/searchByCategoryId",
        params: {
          searchValue: this.$store.state.searchValue,
          cateId: this.$store.state.cateId,
        }
      })
        .then(res => {
          this.$store.commit("setSearchValue", this.searchValue);
          this.$store.commit("setPaginationData", res.data);
        })
        .catch(er => {
          console.log(er);
        });
    }
  },
  mounted() {
    this.$axios({
      method: "get",
      url: "api/category"
    })
      .then(res => {
        this.categories = res.data;
      })
      .catch(er => {
        console.log(er);
      });
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

.txtCart {
  display: none;
}

.toolbar-btn:hover div.txtCart {
  display: block;
}
.toolbar-btn:hover div.iconCart {
  display: none;
}

.txtHistory {
  display: none;
}

.toolbar-btn:hover div.txtHistory {
  display: block;
}
.toolbar-btn:hover div.iconHistory {
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
  width: 40px;
  height: 40px;
  background: white;
  box-sizing: border-box;
  border-radius: 25px;
  border: 4px solid white;
  padding: 5px;
}

input {
  position: absolute;
  top: -5px;
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
  top: -4px;
  right: -5px;
  border-radius: 50%;
  color: grey;
  text-align: center;
  font-size: 2em;
  transition: all 1s;
}

.formclick {
  width: 300px;
  cursor: pointer;
}
.formclick input {
  display: block;
}
.formclick .fa {
  background: grey;
  color: white;
}
</style>

