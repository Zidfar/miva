import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String image;
  final String name;
  final String? description;
  final String? dosage;
  final String? instruction;
  final String? price;

  const ProductDetailScreen({
    super.key,
    required this.image,
    required this.name,
    this.description,
    this.dosage,
    this.instruction,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    // Dummy data, gunakan parameter dari navigator
    final productDescription =
        description ?? "Deskripsi produk akan tampil di sini.";
    final productInstruction =
        instruction ?? "Gunakan sesuai anjuran dokter/apoteker.";
    final productDosage = dosage ?? "500 mg";
    final productPrice = price ?? "Rp 20.000";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA8D5BA),
        title: Text(name, style: const TextStyle(color: Colors.black87)),
        iconTheme: const IconThemeData(color: Colors.black87),
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {}, // TODO: Fitur wishlist
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                image,
                width: 180,
                height: 180,
                fit: BoxFit.contain,
                errorBuilder:
                    (_, __, ___) => Icon(
                      Icons.medical_services,
                      size: 100,
                      color: Colors.grey[300],
                    ),
              ),
            ),
          ),
          const SizedBox(height: 22),
          Text(
            name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            productPrice,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF7FA893),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 18),
          // Dosis
          Row(
            children: [
              const Text(
                "Dosis: ",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(productDosage),
              // TODO: Bisa diganti Dropdown untuk pilihan dosis
            ],
          ),
          const SizedBox(height: 18),
          // Instruksi
          const Text(
            "Instruksi Pemakaian",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(productInstruction),
          const SizedBox(height: 18),
          // Deskripsi
          const Text(
            "Deskripsi",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(productDescription),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: Simpan ke Cart
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Berhasil ditambahkan ke cart!"),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7FA893),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.shopping_cart_outlined),
              label: const Text("Simpan ke Cart"),
            ),
          ),
        ],
      ),
    );
  }
}
