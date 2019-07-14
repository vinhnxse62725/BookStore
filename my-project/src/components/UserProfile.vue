<template>
  <v-container wrap>
    <v-layout column>
      <v-card>
          <br/>
          <h2 style="text-align:center;">{{this.form.customerID}}</h2>
        <v-card-text>
          <v-text-field v-model="form.fullname" label="Fullname"></v-text-field>
          <v-text-field v-model="form.email" label="Email"></v-text-field>
          <v-text-field v-model="form.gender" label="Gender"></v-text-field>
          <v-text-field v-model="form.age" label="Age"></v-text-field>
          <v-text-field v-model="form.address" label=" Address"></v-text-field>
          <v-text-field v-model="form.phone" label=" Phone"></v-text-field>
        </v-card-text>
        <v-card-actions>
          <v-btn color="primary" @click.native="update">
            <v-icon left dark>check</v-icon>Change Info
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-layout>
    <avatar-picker
      v-model="showAvatarPicker"
      :current-avatar="form.avatar"
      @selected="selectAvatar"
    ></avatar-picker>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      form: {
        address: "Supplier",
        admin: false,
        age: 22,
        customerID: "user1",
        email: "vinhnxse62725@gmail.com",
        fullname: "user",
        gender: "Male",
        id: 1,
        phone: "0123456789"
      }
    };
  }
};
</script>