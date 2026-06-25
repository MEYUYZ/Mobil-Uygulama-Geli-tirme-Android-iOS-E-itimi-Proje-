import 'package:flutter/material.dart';
import 'package:ilk_uygulamam/models/urun_model.dart';

class AnaSayfa extends StatelessWidget {
  final List<Urun> sepet;
  const AnaSayfa({super.key, required this.sepet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Sepet İkonu ve Ürün Sayısı Rozeti
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black87, size: 28),
                onPressed: () => Navigator.pushNamed(context, '/sepet'),
              ),
              if (sepet.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      '${sepet.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Populer Ürünler', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('En çok satan ürünler', style: TextStyle(fontSize: 16, color: Colors.grey[500])),
              const SizedBox(height: 20),
              Container(
                height: 45,
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Ürün Ara',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.72,
                ),
                itemCount: urunlerKatalogu.length,
                itemBuilder: (context, index) {
                  final urun = urunlerKatalogu[index];
                  return InkWell(
                    onTap: () => Navigator.pushNamed(context, '/detay', arguments: urun),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(16)),
                            child: Center(child: Padding(padding: const EdgeInsets.all(16.0), child: Image.network(urun.resimUrl))),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(urun.isim, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        Text('Fırsat ürünü', style: TextStyle(color: Colors.grey[500], fontSize: 11)),
                        const SizedBox(height: 4),
                        Text(urun.fiyat, style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}