import Vuex from 'vuex'
import Vue from 'vue'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        isSignIn: localStorage.getItem("sign-in") != null,
        isSignOut: false,
        isSignInMessage: false
    },
    getter: {

    },
    mutations: {
        loginStatus(state, payload) {
            state.isSignIn = payload;
        }
        , logoutStatus(state, payload) {
            state.isSignOut = payload;

        },
        loginMessageStatus(state, payload){
            state.isSignInMessage = payload;
        }
    },
    action: {

    }
})