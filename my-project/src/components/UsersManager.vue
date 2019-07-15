<template>
  <v-card>
    <v-card-title>
      Users Manager
      <v-spacer></v-spacer>
      <v-text-field v-model="search" append-icon="search" label="Search" single-line hide-details></v-text-field>
      <!-- <v-spacer></v-spacer>
        <v-btn medium color="success">
          Create New Product
      </v-btn>-->
    </v-card-title>
    <v-data-table :headers="headers" :items="desserts" :search="search">
      <template v-slot:items="props">
        <td>{{ props.item.id }}</td>
        <td class="text-xs-center">{{ props.item.customerID }}</td>
        <td class="text-xs-center">{{ props.item.fullname }}</td>
        <td class="text-xs-center">{{ props.item.gender }}</td>
        <td class="text-xs-center">{{ props.item.age }}</td>
        <td class="text-xs-center">{{ props.item.email }}</td>
        <td class="text-xs-center">{{ props.item.phone }}</td>
        <td class="text-xs-center">{{ props.item.address }}</td>
        <td class="text-xs-center">{{ props.item.admin }}</td>
        <td class="text-xs-center">
          <v-btn fab small color="warning">
            <v-icon>edit</v-icon>
          </v-btn>
          <v-btn fab small color="error">
            <v-icon>clear</v-icon>
          </v-btn>
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
        { text: "Actions", align: "center" }
      ],
      desserts: []
    };
  },
  mounted() {
    this.$axios({
      method: "get",
      url: "auth/user/getAll"
    })
      .then(rs => {
        console.table(rs.data);
        this.desserts = rs.data;
      })
      .catch(error => {
        console.log(error);
      });
  }
};
</script>