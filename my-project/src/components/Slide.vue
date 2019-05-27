<template>
  <v-carousel hide-delimiters>
    <v-carousel-item
      v-for="(item,i) in items"
      :key="i"
      :src="item.src"
    ></v-carousel-item>
  </v-carousel>
</template>

<script>
  export default {
    data () {
      return {
        items: [
          {
            src: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bestselling-books-2017-1513175527.jpg'
          },
          {
            src: 'https://amp.businessinsider.com/images/5c0ad79ff3d34923ba1f61e4-1920-960.jpg'
          },
          {
            src: 'https://img.thedailybeast.com/image/upload/c_crop,d_placeholder_euli9k,h_1440,w_2560,x_0,y_0/dpr_1.5/c_limit,w_1044/fl_lossy,q_auto/v1552084297/afawwwfa_i2oq5t'
          },
          {
            src: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNb_5qLHjnqCbsI8ADKu9cZhPrP96hiaXjWw2b95lXdrdyYei2WQ'
          }
        ]
      }
    }
  }
</script>