import axios from 'axios';
export default{
    install(Vue){
        Vue.prototype.$axios = axios.create({
            // baseURL: "http://bookstore-env.qvzipcjrze.ap-southeast-1.elasticbeanstalk.com",
            baseURL: "http://localhost:5000",          
            headers:{
                "Access-Control-Allow-Origin": "*",
                "Content-Type":"application/json",
                // 'X-Requested-With': 'XMLHttpRequest',
                // "Access-Control-Allow-Methods": "GET, PUT, POST, DELETE",
                // "Access-Control-Allow-Headers": "Origin, X-Requested-With, Content-Type, Accept, Authorization",
                // "Access-Control-Allow-Credentials":"true"

            }
        })
    }
}