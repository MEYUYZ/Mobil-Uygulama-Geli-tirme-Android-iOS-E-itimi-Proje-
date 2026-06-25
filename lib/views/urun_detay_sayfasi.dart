import 'package:flutter/material.dart';
import '../models/urun_model.dart';

class UrunDetaySayfasi extends StatelessWidget {
  final Function(Urun) onSepeteEkle;
  final List<Urun> sepet;

  const UrunDetaySayfasi({super.key, required this.onSepeteEkle, required this.sepet});

  @override
  Widget build(BuildContext context) {
    final urun = ModalRoute.of(context)!.settings.arguments as Urun;
    final bool zatenSepetteMi = sepet.contains(urun);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 90,
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 16, color: Colors.black87),
          label: const Text('Geri', style: TextStyle(color: Colors.black87, fontSize: 16)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.grey[50],
                    padding: const EdgeInsets.all(24.0),
                    child: Image.network(urun.resimUrl, fit: BoxFit.contain),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(urun.isim, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                        Text('Fiyat: ${urun.fiyat}', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                        const SizedBox(height: 24),
                        const Text('Özellikler', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                       ...urun.ozellikler.entries.map((e) =>
  Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(e.key, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        ),
        Expanded(
          child: Text(e.value, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        ),
      ],
    ),
  ),
).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
                    
      
          
          
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: zatenSepetteMi ? Colors.grey[300] : Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                onPressed: zatenSepetteMi 
                    ? null // Eğer ürün sepetteyse buton tıklanamaz olsun
                    : () {
                        onSepeteEkle(urun);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${urun.isim} Sepete Ekle!'), duration: const Duration(seconds: 1)),
                        );
                        Navigator.pop(context); // Ekledikten sonra ana sayfaya geri atsın
                      },
                child: Text(
                  zatenSepetteMi ? 'Sepette' : 'Sepete Ekle',
                  style: TextStyle(color: zatenSepetteMi ? Colors.grey[600] : Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}