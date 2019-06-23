import Vuex from 'vuex'
import Vue from 'vue'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        isSignIn: localStorage.getItem("sign-in") != null,
        isAdmin: localStorage.getItem("user-role") != null,
        isSignOut: false,
        search: [],
        // isSignInMessage: false,
        cart: [],
        products: [],
        currentPage: 1,
        itemsPerPage: 4,
        totalPages: 0
    },
    getters: {
        getPaginationProducts(state) {
            return state.products.slice(
                (state.currentPage - 1) * state.itemsPerPage,
                (state.currentPage - 1) * state.itemsPerPage + state.itemsPerPage
              );
        }
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
        // loginMessageStatus(state, payload){
        //     state.isSignInMessage = payload;
        // },
        updateCart(state, payload) {
            state.cart = payload;
        },
        setCurrentSelectedPage(state, payload) {
            state.currentPage = payload
        },
        setNextSelectedPage(state) {
            state.currentPage = state.currentPage + 1
        },
        setPrevSelectedPage(state, payload) {
            state.currentPage = state.currentPage - 1
        },
        setPaginationData(state, payload) {
            state.products = payload;
            state.totalPages = Math.ceil(
                state.products.length / state.itemsPerPage
            );
        }
    },
    action: {

    }
})