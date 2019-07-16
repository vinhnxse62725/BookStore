import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Login from '@/components/Login'
import Register from '@/components/Register'
import Cart from '@/components/Cart'
import History from '@/components/OrderHistory'
import UsersManager from '@/components/UsersManager'
import BooksManager from '@/components/BooksManager'
import UserProfile from '@/components/UserProfile'
import EditBook from '@/components/EditBook'
import OrdersManager from '@/components/OrdersManager'
import Page403 from '@/components/Page403'
import ChartsReport from '@/components/ChartsReport'
import EditUser from '@/components/EditUser'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/register',
      name: 'Register',
      component: Register
    },
    {
      path: '/cart',
      name: 'Cart',
      component: Cart
    },
    {
      path: '/history',
      name: 'History',
      component: History
    },
    {
      path: '/userprofile',
      name: 'UserProfile',
      component: UserProfile
    },
    {
      path: '/usersmanager',
      name: 'UsersManager',
      component: UsersManager
    },
    {
      path: '/edituser',
      name: 'EditUser',
      component: EditUser
    },
    {
      path: '/booksmanager',
      name: 'BooksManager',
      component: BooksManager
    },
    {
      path: '/editbook',
      name: 'EditBook',
      component: EditBook
    },
    {
      path: '/ordersmanager',
      name: 'OrdersManager',
      component: OrdersManager
    },
    {
      path: '/page403',
      name: 'Page403',
      component: Page403
    },
    {
      path: '/chartsreport',
      name: 'ChartsReport',
      component: ChartsReport
    },
  ],
})
