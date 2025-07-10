import 'package:flutter/material.dart';
import '../../product/screens/product_detail_screen.dart'; // Pastikan path benar

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  // Data wishlist dummy
  List<Map<String, String>> wishlist = [
    {
      'image': 'assets/images/paracetamol.png',
      'name': 'Paracetamol',
      'price': 'Rp 20.000',
    },
    {
      'image': 'assets/images/vitamin_c.png',
      'name': 'Vitamin C',
      'price': 'Rp 18.000',
    },
  ];

  void _removeItem(int i) {
    setState(() {
      wishlist.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
        backgroundColor: const Color(0xFFA8D5BA),
      ),
      body:
          wishlist.isEmpty
              ? const Center(
                child: Text(
                  "Wishlist masih kosong.",
                  style: TextStyle(fontSize: 18),
                ),
              )
              : ListView.separated(
                padding: const EdgeInsets.all(18),
                itemCount: wishlist.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, i) {
                  final item = wishlist[i];
                  return ListTile(
                    tileColor: const Color(0xFFF4F5F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: Image.asset(
                      item['image']!,
                      width: 54,
                      height: 54,
                      fit: BoxFit.contain,
                      errorBuilder:
                          (_, __, ___) => Icon(
                            Icons.medical_services,
                            size: 38,
                            color: Colors.grey[300],
                          ),
                    ),
                    title: Text(
                      item['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(item['price']!),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.redAccent,
                      ),
                      onPressed: () => _removeItem(i),
                    ),
                    onTap: () {
                      // Arahkan ke Product Detail
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => ProductDetailScreen(
                                image: item['image']!,
                                name: item['name']!,
                                price: item['price']!,
                                description:
                                    'Deskripsi produk akan tampil di sini.',
                                dosage: '500 mg',
                                instruction:
                                    'Gunakan sesuai anjuran dokter/apoteker.',
                              ),
                        ),
                      );
                    },
                  );
                },
              ),
    );
  }
}
