import 'package:flutter/material.dart';
import '../models/urun_model.dart';

class SepetSayfasi extends StatelessWidget {
  final List<Urun> sepet;
  final Function(Urun) onSepettenCikar;

  const SepetSayfasi({super.key, required this.sepet, required this.onSepettenCikar});

String _toplamHesapla() {
  double toplam = 0;
  for (final urun in sepet) {
    final temiz = urun.fiyat
        .replaceAll(' TL', '')
        .replaceAll('.', '')
        .replaceAll(',', '.');
    toplam += double.tryParse(temiz) ?? 0;
  }

  return toplam.toStringAsFixed(0).replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (m) => '${m[1]}.',
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 90,
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 16, color: Colors.black87),
          label: const Text('Sepet', style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.bold)),
        ),
      ),
      
      // EĞER SEPET BOŞSA (4. Ekran)
      body: sepet.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  const Text('Sepetiniz Boş', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Alışverişe başlamak için ürün ekleyin', style: TextStyle(color: Colors.grey[500])),
                ],
              ),
            )
          
          // EĞER SEPET DOLUYSA (3. Ekran)
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: sepet.length,
                    itemBuilder: (context, index) {
                      final urun = sepet[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                        child: Row(
                          children: [
                            // Ürün Resmi Kutusu
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.all(8),
                              child: Image.network(urun.resimUrl),
                            ),
                            const SizedBox(width: 16),
                            // Ürün Adı ve Fiyatı
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(urun.isim, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                  const SizedBox(height: 4),
                                  Text(urun.fiyat, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                                ],
                              ),
                            ),                            // SEPETTEN ÇIKARMA BUTONU (-)
                            IconButton(
                              icon: Icon(Icons.remove_circle_outline, color: Colors.grey[400]),
                              onPressed: () {
                                onSepettenCikar(urun);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('${urun.isim} sepette çıkarıldı'), duration: const Duration(seconds: 1)),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // En Alttaki Siyah Checkout (Satın Al) Butonu
Padding(
  padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text('Toplam', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      Text(
        '${_toplamHesapla()} TL',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ],
  ),
),
                
                // En Alttaki Siyah Checkout (Satın Al) Butonu
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () {},
                      child: const Text('Checkout', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}