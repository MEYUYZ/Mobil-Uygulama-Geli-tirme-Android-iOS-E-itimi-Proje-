// Ürünün şablonunu belirleyen sınıf
class Urun {
  final String isim;
  final String fiyat;
  final String resimUrl;
  final Map<String, String> ozellikler; 

  const Urun({
    required this.isim,
    required this.fiyat,
    required this.resimUrl,
    required this.ozellikler,
  });}


// Ekranda sergileyeceğimiz örnek veriler
final List<Urun> urunlerKatalogu = [
  Urun(
    isim: 'Kablosuz Kulaklık', fiyat: '1.200 TL',
    resimUrl: 'https://cdn.vatanbilgisayar.com/Upload/PRODUCT/jbl/thumb/139118-1_large.jpg',
    ozellikler: {
      'Bağlantı': 'Bluetooth 5.3',
      'Pil ömrü': '40 saat',
      'Sürücü': '40mm dinamik',
      'Mikrofon': 'Dahili gürültü engelleme',
      'Ağırlık': '250 g',
      'Renk': 'Siyah / Beyaz',
    },
  ),
  Urun(
    isim: 'Akıllı Saat', fiyat: '2.500 TL',
    resimUrl: 'https://tse4.mm.bing.net/th/id/OIP.xsSWqyBW0GiBkyNRgw6WOQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
    ozellikler: {
      'Ekran': '1.4" AMOLED',
      'Pil ömrü': '7 gün',
      'Su geçirmezlik': '5 ATM',
      'Sensörler': 'Kalp atışı, SpO2',
      'GPS': 'Dahili',
      'Uyumluluk': 'iOS & Android',
    },
  ),
  Urun(
    isim: 'Sırt Çantası', fiyat: '450 TL',
    resimUrl: 'https://cdn.dsmcdn.com/ty1450/product/media/images/prod/QC/20240730/22/8eea98a6-17aa-3dbf-b2a3-402ca951e1ff/1_org_zoom.jpg',
    ozellikler: {
      'Kapasite': '25 litre',
      'Malzeme': 'Su geçirmez naylon',
      'Laptop bölmesi': '15.6" uyumlu',
      'USB şarj': 'Dahili port',
      'Ağırlık': '900 g',
      'Renk': 'Lacivert / Siyah',
    },
  ),
  Urun(
    isim: 'İphone 11', fiyat: '25000 TL',
    resimUrl: 'https://tse2.mm.bing.net/th/id/OIP.aUOzhRdSsveURd8JV0PePgHaE8?rs=1&pid=ImgDetMain&o=7&rm=3',
    ozellikler: {
      'Ekran': '6.1" Liquid Retina',
      'İşlemci': 'Apple A13 Bionic',
      'Kamera': '12 MP çift (gece modu)',
      'Batarya': '3110 mAh / 1 gün',
      'Depolama': '64 / 128 / 256 GB',
      'Güvenlik': 'Face ID',
    },
  ),
  Urun(
    isim: 'Dijital Termos', fiyat: '1000 TL',
    resimUrl: 'https://i5.walmartimages.com/asr/c6bfddfc-80c4-4aee-91ae-35990219e47f.e594d51e9f35cccdb5109e094b0666f2.png',
    ozellikler: {
      'Kapasite': '500 ml',
      'Ekran': 'LED sıcaklık göstergesi',
      'Isı koruma': '12 saat sıcak, 24 saat soğuk',
      'Malzeme': '304 paslanmaz çelik',
      'Şarj': 'USB-C manyetik',
      'Renk': 'Gümüş / Siyah',
    },
  ),
  Urun(
    isim: 'Gözlük', fiyat: '500 TL',
    resimUrl: 'https://tse3.mm.bing.net/th/id/OIP.NDEjmfT4ErjbIhlHp8XJ7AHaE6?rs=1&pid=ImgDetMain&o=7&rm=3',
    ozellikler: {
      'Çerçeve': 'Titanyum alaşım',
      'Cam': 'Anti-yansıma UV400',
      'Stil': 'Dikdörtgen',
      'Ağırlık': '18 g',
      'Kılıf': 'Sert kılıf dahil',
      'Kullanım': 'Unisex',
    },
  ),
  Urun(
    isim: 'Tablet', fiyat: '10.100 TL',
    resimUrl: 'https://p2-ofp.static.pub/fes/cms/2023/02/22/pkhjbh23c7sjfxf76k6e6usevy3ixi851221.png',
    ozellikler: {
      'Ekran': '10.9" IPS LCD',
      'İşlemci': 'Octa-core 2.4 GHz',
      'RAM': '6 GB',
      'Depolama': '128 / 256 GB',
      'Batarya': '7040 mAh',
      'Bağlantı': 'Wi-Fi 6, USB-C',
    },
  ),
];