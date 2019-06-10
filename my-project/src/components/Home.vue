<template>
  <div>
    <!-- snackbar logout -->
    <v-snackbar
      v-if="$store.state.isSignOut"
      v-model="snackbarSignOut"
      :bottom="y === 'bottom'"
      :left="x === 'left'"
      :multi-line="mode === 'multi-line'"
      :right="x === 'right'"
      :timeout="timeout"
      :top="y === 'top'"
      :vertical="mode === 'vertical'"
    >
      {{ textSignOut }}
      <v-btn class="font-weight-bold" color="red" flat @click="snackbarSignOut = false">Close</v-btn>
    </v-snackbar>
    <!-- snackbar login -->
    <v-snackbar
      v-if="$store.state.isSignInMessage"
      v-model="snackbarSignIn"
      :bottom="y === 'bottom'"
      :left="x === 'left'"
      :multi-line="mode === 'multi-line'"
      :right="x === 'right'"
      :timeout="timeout"
      :top="y === 'top'"
      :vertical="mode === 'vertical'"
    >
      {{ textSignIn }}
      <v-btn class="font-weight-bold" color="red" flat @click="snackbarSignIn = false">Close</v-btn>
    </v-snackbar>
    <div class="container">
      <app-slide></app-slide>

      <v-layout wrap style="margin-top:50px;">
        <!-- <div class="col-md-3" v-for="n  in 20 " :key="n"> -->
        <div class="col-md-3" v-for="product in products">
          <single-product :product="product"></single-product>
        </div>
      </v-layout>
    </div>
    <div class="text-xs-center" style="margin-bottom: 50px">
      <v-pagination  :length="6"></v-pagination>
    </div>
  </div>
</template>
  </div>
</template>
<script>
import AppSlide from "./Slide.vue";
import SingleProduct from "./SingleProduct.vue";
export default {
  components: { AppSlide, SingleProduct },
  data() {
    return {
      snackbarSignOut: true,
      snackbarSignIn: true,
      y: "top",
      x: null,
      mode: "",
      timeout: 6000,
      textSignOut: "Logout Successfully",
      textSignIn: "Login Successfully",
      products: [
        {
          id: "1",
          img:
            "https://salt.tikicdn.com/cache/550x550/media/catalog/product/i/m/img117.u3059.d20170616.t100547.729023.jpg",
          info:
            "Lorem ipsum dolor sit amet, brute iriure accusata ne mea. Eos suavitate referrentur ad, te duo agam libris qualisque, utroque quaestio accommodare no qui. Et percipit laboramus usu, no invidunt verterem nominati mel. Dolorem ancillae an mei, ut putant invenire splendide mel, ea nec propriae adipisci. Ignota salutandi accusamus in sed, et per malis fuisset, qui id ludus appareat.",
          title: "Nhà Giả Kim",
          price: "48.000 ₫",
          discount: "30%"
        },
        {
          id: "2",
          img:
            "https://salt.tikicdn.com/cache/550x550/ts/product/2e/eb/ad/9558a365adde6688d4c71a200d78310c.jpg",
          info:
            "Lorem ipsum dolor sit amet, brute iriure accusata ne mea. Eos suavitate referrentur ad, te duo agam libris qualisque, utroque quaestio accommodare no qui. Et percipit laboramus usu, no invidunt verterem nominati mel. Dolorem ancillae an mei, ut putant invenire splendide mel, ea nec propriae adipisci. Ignota salutandi accusamus in sed, et per malis fuisset, qui id ludus appareat.",
          title: "Đắc Nhân Tâm (Khổ Lớn)",
          price: "53.200 ₫",
          discount: "25%"
        },
        {
          id: "3",
          img:
            "https://salt.tikicdn.com/cache/550x550/ts/product/3f/bb/c7/c9c14e9e05b605d40ea29249240264f9.jpg",
          info:
            "Lorem ipsum dolor sit amet, brute iriure accusata ne mea. Eos suavitate referrentur ad, te duo agam libris qualisque, utroque quaestio accommodare no qui. Et percipit laboramus usu, no invidunt verterem nominati mel. Dolorem ancillae an mei, ut putant invenire splendide mel, ea nec propriae adipisci. Ignota salutandi accusamus in sed, et per malis fuisset, qui id ludus appareat.",
          title: "Để Con Được Ốm (Tái Bản 2018)",
          price: "61.450 ₫",
          discount: "35%"
        },
        {
          id: "4",
          img:
            "https://salt.tikicdn.com/cache/550x550/ts/product/ca/41/bb/93351eded0a9ff29538401f76f76c2c1.jpg",
          info:
            "Lorem ipsum dolor sit amet, brute iriure accusata ne mea. Eos suavitate referrentur ad, te duo agam libris qualisque, utroque quaestio accommodare no qui. Et percipit laboramus usu, no invidunt verterem nominati mel. Dolorem ancillae an mei, ut putant invenire splendide mel, ea nec propriae adipisci. Ignota salutandi accusamus in sed, et per malis fuisset, qui id ludus appareat.",
          title: "Có Hai Con Mèo Ngồi Bên Cửa Sổ",
          price: "62.895 ₫",
          discount: "26%"
        },
        {
          id: "5",
          img:
            "https://salt.tikicdn.com/cache/550x550/ts/product/a5/d8/34/841d0260cc305115f6753c25caadd5b0.jpg",
          info:
            "Lorem ipsum dolor sit amet, brute iriure accusata ne mea. Eos suavitate referrentur ad, te duo agam libris qualisque, utroque quaestio accommodare no qui. Et percipit laboramus usu, no invidunt verterem nominati mel. Dolorem ancillae an mei, ut putant invenire splendide mel, ea nec propriae adipisci. Ignota salutandi accusamus in sed, et per malis fuisset, qui id ludus appareat.",
          title: "Đọc Vị Bất Kỳ Ai",
          price: "69.000 đ",
          discount: "25%"
        },
        {
          id: "6",
          img:
            "https://salt.tikicdn.com/cache/550x550/ts/product/d1/a8/37/f6007eaebb42ed2757f29991a68d263b.jpg",
          info:
            "Lorem ipsum dolor sit amet, brute iriure accusata ne mea. Eos suavitate referrentur ad, te duo agam libris qualisque, utroque quaestio accommodare no qui. Et percipit laboramus usu, no invidunt verterem nominati mel. Dolorem ancillae an mei, ut putant invenire splendide mel, ea nec propriae adipisci. Ignota salutandi accusamus in sed, et per malis fuisset, qui id ludus appareat.",
          title: "Nếu Biết Trăm Năm Là Hữu Hạn (Tái Bản 2018)",
          price: "70.500 ₫",
          discount: "25%"
        },
        {
          id: "7",
          img:
            "https://salt.tikicdn.com/cache/550x550/media/catalog/product/c/o/con_y_u_b_ch_ng_n_o.jpg",
          info:
            "Lorem ipsum dolor sit amet, brute iriure accusata ne mea. Eos suavitate referrentur ad, te duo agam libris qualisque, utroque quaestio accommodare no qui. Et percipit laboramus usu, no invidunt verterem nominati mel. Dolorem ancillae an mei, ut putant invenire splendide mel, ea nec propriae adipisci. Ignota salutandi accusamus in sed, et per malis fuisset, qui id ludus appareat.",
          title: "Con Yêu Bố Chừng Nào",
          price: "69.000 đ",
          discount: "25%"
        },
        {
          id: "8",
          img:
            "https://salt.tikicdn.com/cache/550x550/media/catalog/product/n/x/nxbtrestoryfull_02052014_030554_1.jpg",
          info:
            "Lorem ipsum dolor sit amet, brute iriure accusata ne mea. Eos suavitate referrentur ad, te duo agam libris qualisque, utroque quaestio accommodare no qui. Et percipit laboramus usu, no invidunt verterem nominati mel. Dolorem ancillae an mei, ut putant invenire splendide mel, ea nec propriae adipisci. Ignota salutandi accusamus in sed, et per malis fuisset, qui id ludus appareat.",
          title: "Khi Lỗi Thuộc Về Những Vì Sao",
          price: "71.800 ₫",
          discount: "32%"
        },
        {
          id: "9",
          img:
            "https://salt.tikicdn.com/cache/550x550/media/catalog/product/a/i/ai-lay-mieng-pho-mat-cua-toi-a.u547.d20160407.t084016.jpg",
          info:
            "Lorem ipsum dolor sit amet, brute iriure accusata ne mea. Eos suavitate referrentur ad, te duo agam libris qualisque, utroque quaestio accommodare no qui. Et percipit laboramus usu, no invidunt verterem nominati mel. Dolorem ancillae an mei, ut putant invenire splendide mel, ea nec propriae adipisci. Ignota salutandi accusamus in sed, et per malis fuisset, qui id ludus appareat.",
          title: " Ai Lấy Miếng Pho Mát Của Tôi (Tái Bản)",
          price: "26.600 ₫",
          discount: "30%"
        },
        {
          id: "10",
          img:
            "https://salt.tikicdn.com/cache/550x550/media/catalog/product/c/o/con_cho_nho_bia_thuong_bia_1_1.jpg",
          info:
            "Lorem ipsum dolor sit amet, brute iriure accusata ne mea. Eos suavitate referrentur ad, te duo agam libris qualisque, utroque quaestio accommodare no qui. Et percipit laboramus usu, no invidunt verterem nominati mel. Dolorem ancillae an mei, ut putant invenire splendide mel, ea nec propriae adipisci. Ignota salutandi accusamus in sed, et per malis fuisset, qui id ludus appareat.",
          title: "Con Chó Nhỏ Mang Giỏ Hoa Hồng (Bìa Mềm)",
          price: "64.000 ₫",
          discount: "29%"
        }
      ]
    };
  }
};
</script>
<style scoped>
.toolbar {
  z-index: 999;
}
</style>


