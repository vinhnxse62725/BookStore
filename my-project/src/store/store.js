import Vuex from 'vuex'
import Vue from 'vue'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        isSignIn: localStorage.getItem("sign-in") != null,
        isAdmin: localStorage.getItem("user-role") != null,
        isSignOut: false,
        isSignInMessage: false,
        cart:[],
    },
    getter: {

    },
    mutations: {
        loginStatus(state, payload) {
            state.isSignIn = payload;
        },
        adminStatus(state, payload) {
            state.isAdmin = payload;
        }
        , logoutStatus(state, payload) {
            state.isSignOut = payload;

        },
        loginMessageStatus(state, payload){
            state.isSignInMessage = payload;
        },
        updateCart(state, payload){
            state.cart = payload;
        }
    },
    action: {

    }
})