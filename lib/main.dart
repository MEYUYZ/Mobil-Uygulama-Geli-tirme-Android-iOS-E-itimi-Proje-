import 'package:flutter/material.dart';
import 'views/ana_sayfa.dart';
import 'views/urun_detay_sayfasi.dart';
import 'views/sepet_sayfasi.dart';
import 'models/urun_model.dart';

void main() {
  runApp(const MiniKatalogUygulamasi());
}

class MiniKatalogUygulamasi extends StatefulWidget {
  const MiniKatalogUygulamasi({super.key});

  @override
  State<MiniKatalogUygulamasi> createState() => _MiniKatalogUygulamasiState();
}

class _MiniKatalogUygulamasiState extends State<MiniKatalogUygulamasi> {
  // MERKEZİ STATE: Sepetteki ürünlerin tutulduğu liste
  final List<Urun> sepet = [];

  // Sepete ürün ekleme fonksiyonu
  void sepeteEkle(Urun urun) {
    setState(() {
      sepet.add(urun);
    });
  }

  // Sepetten ürün çıkarma fonksiyonu
  void sepettenCikar(Urun urun) {
    setState(() {
      sepet.remove(urun);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Katalog',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      // Sayfalara sepet bilgilerini ve fonksiyonlarını argüman/parametre olarak gönderiyoruz
      routes: {
        '/': (context) => AnaSayfa(sepet: sepet),
        '/detay': (context) => UrunDetaySayfasi(onSepeteEkle: sepeteEkle, sepet: sepet),
        '/sepet': (context) => SepetSayfasi(sepet: sepet, onSepettenCikar: sepettenCikar),
      },
    );
  }
}