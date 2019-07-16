<template>
  <v-card>
    <v-progress-linear
      :indeterminate="true"
      :active="loading"
      style="position:absolute; margin-top:0px;"
    ></v-progress-linear>
    <v-card-title>
      <div class="text-uppercase black--text" id="menulogo">
        <span class="font-weight-light" style="font-size: 20px;">Users</span>
        <span style="font-size: 20px;">Manager</span>
      </div>
      <v-spacer></v-spacer>
      <v-text-field v-model="search" append-icon="search" label="Search" single-line hide-details></v-text-field>
      <!-- <v-spacer></v-spacer>
        <v-btn medium color="success">
          Create New Product
      </v-btn>-->
    </v-card-title>
    <v-data-table :headers="headers" :items="desserts" :search="search">
      <template v-slot:items="props">
        <td class="text-xs-center">{{ props.item.id }}</td>
        <td class="text-xs-center">{{ props.item.customerID }}</td>
        <td class="text-xs-center">{{ props.item.fullname }}</td>
        <td class="text-xs-center">{{ props.item.gender }}</td>
        <td class="text-xs-center">{{ props.item.age }}</td>
        <td class="text-xs-center">{{ props.item.email }}</td>
        <td class="text-xs-center">{{ props.item.phone }}</td>
        <td class="text-xs-center">{{ props.item.address }}</td>
        <td class="text-xs-center">
          <v-icon v-if="props.item.admin" color="green">vpn_key</v-icon>
          <v-icon v-if="!props.item.admin" color="grey">person</v-icon>
        </td>
        <td class="text-xs-center">
          <v-icon v-if="props.item.active" color="green">done</v-icon>
          <v-icon v-if="!props.item.active" color="red">clear</v-icon>
        </td>
        <td class="text-xs-center">
          <v-layout justify-center block>
            <v-btn fab small color="warning" @click="editUser(props.item.id)">
              <v-icon>edit</v-icon>
            </v-btn>
            <v-btn
              fab
              small
              color="error"
              :disabled="props.item.customerID == user.customerID"
              @click="changeActive(props.item)"
            >
              <v-icon>clear</v-icon>
            </v-btn>
          </v-layout>
        </td>
      </template>
      <template v-slot:no-results>
        <v-alert
          :value="true"
          color="error"
          icon="warning"
        >Your search for "{{ search }}" found no results.</v-alert>
      </template>
    </v-data-table>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      loading: true,
      user: [],
      search: "",
      headers: [
        {
          text: "Id",
          value: "id",
          align: "center"
        },
        {
          text: "Username",
          value: "customerID",
          align: "center"
        },
        { text: "Fullname", value: "fullname", align: "center" },
        { text: "Gender", value: "gender", align: "center" },
        { text: "Age", value: "age", align: "center" },
        { text: "Email", value: "email", align: "center" },
        { text: "Phone", value: "phone", align: "center" },
        { text: "Address", value: "address", align: "center" },
        { text: "isAdmin", value: "admin", align: "center" },
        { text: "isActive", value: "active", align: "center" },
        { text: "Actions", align: "center", width: "15%" }
      ],
      desserts: []
    };
  },
  methods: {
    editUser(id) {
      localStorage.setItem("editUserID", id);
      this.$router.push("/edituser");
    },
    changeActive(user) {
      this.$axios({
        method: "put",
        url: "auth/user/active/" + user.id,
        data: {
          active: !user.active
        }
      })
        .then(res => {
          this.$swal({
            title: "Success",
            text: "User has changed active successful !",
            type: "success",
            confirmButtonText: "OK",
            timer: 3000,
            allowOutsideClick: false
          }).then(result => {
            this.loading = true;
            this.$axios({
              method: "get",
              url: "auth/user/getAll"
            })
              .then(rs => {
                // console.table(rs.data);
                this.desserts = rs.data;
                this.loading = false;
              })
              .catch(error => {
                console.log(error);
              });
            this.$router.push("/usersmanager");
          });
        })
        .catch(er => {
          console.log(er);
          this.$swal({
            title: "Error!",
            text: "Something Wrong!",
            type: "error",
            confirmButtonText: "OK"
          });
        });
    }
  },
  mounted() {
    this.user = JSON.parse(localStorage.getItem("profile"));
    let isAdmin = localStorage.getItem("user-role") === 'true' ? true : false;
    if (!isAdmin) {
      this.$router.push("/page403");
    } else {
      this.$axios({
        method: "get",
        url: "auth/user/getAll"
      })
        .then(rs => {
          console.table(rs.data);
          this.desserts = rs.data;
          this.loading = false;
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
};
</script>
<style scoped>
#menulogo {
  border: solid 2px;
  border-color: black;
  padding: 2px;
}
</style>