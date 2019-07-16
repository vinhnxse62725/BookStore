<template>
  <v-navigation-drawer
    class="gray--text"
    app
    v-model="drawer"
    :mini-variant.sync="mini"
    :hide-overlay="true"
    stateless
  >
    <!-- <v-toolbar flat class="transparent"> -->
    <!-- </v-toolbar> -->

    <v-list>
      <v-list-tile>
        <v-list-tile-action>
          <v-toolbar-side-icon @click.stop="mini = !mini"></v-toolbar-side-icon>
        </v-list-tile-action>
        <v-list-tile-content>
          <v-list-tile-title class="text-uppercase black--text">
              <span class="font-weight-light" style="font-size: 16px;">Bookstore</span>
              <span style="font-size: 16px;">Manager</span>
          </v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
      <v-list-tile v-for="item in items" :key="item.title" router :to="item.router">
        <v-list-tile-action>
          <v-icon>{{ item.icon }}</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
          <v-list-tile-title class="font-weight-light">{{ item.title }}</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
      <v-list-tile v-on:click="logout()">
        <v-list-tile-action>
          <v-icon>logout</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
          <v-list-tile-title class="font-weight-light">Logout</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
  </v-navigation-drawer>
</template>
<script>
export default {
  data() {
    return {
      drawer: true,
      items: [
        { title: "Users", icon: "supervisor_account", router: "UsersManager" },
        { title: "Books", icon: "book", router: "BooksManager" },
        { title: "Orders", icon: "view_list", router: "OrdersManager" },
        { title: "Reports", icon: "trending_up", router: "ChartsReport" }
      ],
      mini: true,
      right: null
    };
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
      // this.$axios.defaults.headers.common['Authorization'] = "";
      this.$router.push("/");
    }
  }
};
</script>
<style scoped>
>>> a {
  text-decoration: none;
}
</style>

