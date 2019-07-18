import axios from 'axios';
export default{
    install(Vue){
        Vue.prototype.$axios = axios.create({
            baseURL: "http://bookstoreprj391.ap-southeast-1.elasticbeanstalk.com",
            // baseURL: "http://localhost:5000",          
            headers:{
                "Access-Control-Allow-Origin": "*",
                "Access-Control-Allow-Methods": "*",
                "Content-Type":"application/json",
                Authorization: localStorage.getItem("access-token")
            }
        })
    }
}