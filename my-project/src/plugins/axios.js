import axios from 'axios';
export default{
    install(Vue){
        Vue.prototype.$axios = axios.create({
            baseURL: "http://bookstore-env.qvzipcjrze.ap-southeast-1.elasticbeanstalk.com",
            // baseURL: "http://localhost:5000",           
            headers:{
                "Access-Control-Allow-Origin": "*",
                "Content-Type":"application/json"
            }
        })
    }
}