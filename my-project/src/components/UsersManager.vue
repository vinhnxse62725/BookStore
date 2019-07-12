<template>
    <v-card>
      <v-card-title>
        Users Manager
        <v-spacer></v-spacer>
        <v-text-field v-model="search" append-icon="search" label="Search" single-line hide-details></v-text-field>
        <!-- <v-spacer></v-spacer>
        <v-btn medium color="success">
          Create New Product
        </v-btn> -->
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
      desserts: [
        {
          id: 1,
          customerID: "User1",
          fullname: "User User",
          gender: "Male",
          age: 18,
          email: "email@gmail.com",
          phone: "0123456789",
          address: "Some where ",
          admin: false
        },
        {
          id: 2,
          customerID: "User2",
          fullname: "User User",
          gender: "Femail",
          age: 22,
          email: "email@gmail.com",
          phone: "0123456789",
          address: "Some where ",
          admin: false
        },
        {
          id: 3,
          customerID: "User3",
          fullname: "User User",
          gender: "Male",
          age: 24,
          email: "email@gmail.com",
          phone: "0123456789",
          address: "Some where ",
          admin: false
        },
        {
          id: 4,
          customerID: "User4",
          fullname: "User User",
          gender: "Male",
          age: 25,
          email: "email@gmail.com",
          phone: "0123456789",
          address: "Some where ",
          admin: false
        },
        {
          id: 5,
          customerID: "User6",
          fullname: "User User",
          gender: "Male",
          age: 28,
          email: "email@gmail.com",
          phone: "0123456789",
          address: "Some where ",
          admin: false
        },
        {
          id: 6,
          customerID: "Admin",
          fullname: "Admin",
          gender: "Female",
          age: 22,
          email: "email@gmail.com",
          phone: "0123456789",
          address: "Some where ",
          admin: true
        },
        {
          id: 7,
          customerID: "Admin1",
          fullname: "Admin Admin",
          gender: "Female",
          age: 24,
          email: "email@gmail.com",
          phone: "0123456789",
          address: "Some where ",
          admin: true
        },
        {
          id: 8,
          customerID: "Admin2",
          fullname: "Admin Admin2",
          gender: "Male",
          age: 18,
          email: "email@gmail.com",
          phone: "0123456789",
          address: "Some where ",
          admin: true
        },
        {
          id: 9,
          customerID: "User Admin",
          fullname: "User Admin",
          gender: "Male",
          age: 18,
          email: "email@gmail.com",
          phone: "0123456789",
          address: "Some where ",
          admin: false
        },
        {
          id: 10,
          customerID: "Admin User1",
          fullname: "Admin User",
          gender: "Male",
          age: 18,
          email: "email@gmail.com",
          phone: "0123456789",
          address: "Some where ",
          admin: false
        },
        {
          id: 11,
          customerID: "User1 Admin",
          fullname: "User User",
          gender: "Male",
          age: 18,
          email: "email@gmail.com",
          phone: "0123456789",
          address: "Some where ",
          admin: false
        }
      ]
    };
  }
};
</script>