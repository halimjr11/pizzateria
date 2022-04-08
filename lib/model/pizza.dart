class Pizza {
  String name;
  String description;
  String deliveryTime;
  String price;
  String imageAsset;
  List<String> imageGalleries;

  Pizza({
    required this.name,
    required this.description,
    required this.deliveryTime,
    required this.price,
    required this.imageAsset,
    required this.imageGalleries,
  });
}

var pizzaList = [
  Pizza(
      name: "Margherita",
      description: "Pizza klasik ini dibuat pada tahun 1899 oleh seorang chef asal Italia, Raffaele Esposito. Pizza margherita dibuat untuk menghormati Ratu Italia, Margherita. Topping pizza ini cukup sederhana, hanya berisi olesan saus tomat, keju mozzarella, dan daun basil yang dicincang.",
      deliveryTime: "15min",
      price: "\$20,00",
      imageAsset: "assets/margherita.png",
      imageGalleries: [
        "assets/margherita.png",
        "assets/margherita1.png",
        "assets/margherita2.png"
      ]
  ),
  Pizza(
      name: "Neapolitan",
      description: "Pizza ini merupakan salah satu jenis pizza pertama yang diciptakan. Berasal dari kota Napoli, pizza neapolitan merupakan makanan untuk warga miskin di sana. Biasanya dijual di pasar atau di jalanan. Toppingnya hanya berisi ikan kecil atau anchovy, keju mozzarella dan tomat.",
      deliveryTime: "18min",
      price: "\$16,00",
      imageAsset: "assets/neapolitan.png",
      imageGalleries: [
        "assets/neapolitan.png",
        "assets/neapolitan1.png",
        "assets/neapolitan2.png"
      ]
  ),
  Pizza(
      name: "Marinara",
      description: "Salah satu jenis pizza tradisional versi neapolitan pizza. Sama-sama menggunakan anchovy sebagai topping. Tapi marinara tidak menggunakan tomat, melainkan menggantinya dengan bawang putih, dan oregano.",
      deliveryTime: "15min",
      price: "\$18,00",
      imageAsset: "assets/marinara.png",
      imageGalleries: [
        "assets/marinara.png",
        "assets/marinara1.png",
        "assets/marinara2.png"
      ]
  ),
  Pizza(
      name: "Quattro Stagioni",
      description: "Pizza ini menggunakan bahan dasar tomat dan dibagi menjadi empat bagian yang mewakili empat musim sepanjang tahun. Bahan yang digunakan biasanya artichoke, tumbuhan yang ditanam sebagai makanan dan zaitun untuk melambangkan musim semi.",
      deliveryTime: "18min",
      price: "\$21,00",
      imageAsset: "assets/quattrostagioni.png",
      imageGalleries: [
        "assets/quattrostagioni.png",
        "assets/quattrostagioni1.png",
        "assets/quattrostagioni2.png"
      ]
  ),
  Pizza(
      name: "Focaccia",
      description: "Pizza ini menggunakan bahan dasar tomat dan dibagi menjadi empat bagian yang mewakili empat musim sepanjang tahun. Bahan yang digunakan biasanya artichoke, tumbuhan yang ditanam sebagai makanan dan zaitun untuk melambangkan musim semi.",
      deliveryTime: "17min",
      price: "\$19,00",
      imageAsset: "assets/focaccia.png",
      imageGalleries: [
        "assets/focaccia.png",
        "assets/focaccia1.png",
        "assets/focaccia2.png"
      ]
  ),
  Pizza(
      name: "Capricciosa",
      description: "Pizza capricciosa dilapisi dengan keju mozzarella segar, tomat, jamur kancing, artichoke, dan zaitun. Pinggiran pizza dibuat sangat tipis sehingga rasanya renyah, dan gurih apalagi jika dipadukan dengan saus tomat yang asam segar dan irisan jamur yang kenyal.",
      deliveryTime: "14min",
      price: "\$22,00",
      imageAsset: "assets/capricciosa.png",
      imageGalleries: [
        "assets/capricciosa.png",
        "assets/capricciosa1.png",
        "assets/capricciosa2.png"
      ]
  ),
  Pizza(
      name: "Sicilia",
      description: "Di Italia, pizza sicilia merupakan jenis pizza yang sangat populer. Dengan pinggiran roti yang tebal, pizza ini digemari banyak orang karena rasanya yang enak dan mengenyangkan. Toppingnya juga dikenal beragam, mulai dari kacang, telur rebus, seafood, sampai zaitun hijau.",
      deliveryTime: "16min",
      price: "\$19,00",
      imageAsset: "assets/sicilia.png",
      imageGalleries: [
        "assets/sicilia.png",
        "assets/sicilia1.png",
        "assets/sicilia2.png"
      ]
  ),
  Pizza(
      name: "Pugliese",
      description: "Merupakan salah satu jenis pizza autentik khas Italia yang belum banyak orang tahu. Terbuat dari zaitun yang dipetik langsung dari wilayah Puglia. Dihindangkan dengan bawang, keju mozzarella dan saus tomat.",
      deliveryTime: "16min",
      price: "\$21,50",
      imageAsset: "assets/pugliese.png",
      imageGalleries: [
        "assets/pugliese.png",
        "assets/pugliese1.png",
        "assets/pugliese2.png"
      ]
  ),
  Pizza(
      name: "Al Taglio",
      description: "Pizza ini dikenal juga dengan sebutan pizza rustica. Biasanya ditemukan hampir di seluruh wilayah Italia. Umumnya dijual dengan artichoke, bawang, atau irisan jamur.",
      deliveryTime: "17min",
      price: "\$20,00",
      imageAsset: "assets/altaglio.png",
      imageGalleries: [
        "assets/altaglio.png",
        "assets/altaglio1.png",
        "assets/altaglio2.png"
      ]
  ),
  Pizza(
      name: "Al Quattro Formaggi",
      description: "Pizza ini dibuat menggunakan empat kombinasi jenis keju yang berbeda. Gabungan dari keju mozzarella, dan tiga keju lokal khas Italia seperti parmesan atau parmiiano-reggiano, ricotta, dan gorgonzola. Rasanya gurih, cocok untuk penggemar keju.",
      deliveryTime: "19min",
      price: "\$23,00",
      imageAsset: "assets/quattroformagi.png",
      imageGalleries: [
        "assets/quattroformagi.png",
        "assets/quattroformagi1.png",
        "assets/quattroformagi2.png"
      ]
  ),
];