import 'package:flutter/material.dart';
import '../../order/screens/order_history_screen.dart'; // Tambahkan ini

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.medical_services, 'label': 'Medicine'},
      {'icon': Icons.vaccines, 'label': 'Vitamin'},
      {'icon': Icons.spa, 'label': 'Beauty'},
      {'icon': Icons.favorite, 'label': 'Health'},
    ];

    final priceOfWeek = [
      {'image': 'assets/images/paracetamol.png', 'name': 'Paracetamol'},
      {'image': 'assets/images/vitamin_c.png', 'name': 'Vitamin C'},
      {'image': 'assets/images/obat_batuk.png', 'name': 'OBH Batuk'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar diatur oleh MainNavigation
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          // Shortcut ke Riwayat Pesanan
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.history),
              label: const Text("Riwayat Pesanan"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7FA893),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 18,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrderHistoryScreen()),
                );
              },
            ),
          ),
          // Search bar + filter button
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "search",
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Ink(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.tune),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          // Categories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Categories",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              Text(
                "Show all",
                style: TextStyle(fontSize: 14, color: Color(0xFF7FA893)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 88,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder:
                  (context, i) => Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE4E6E9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          categories[i]['icon'] as IconData,
                          size: 32,
                          color: Colors.black38,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        categories[i]['label'] as String,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
            ),
          ),
          const SizedBox(height: 28),
          // Price of Week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Price of Week",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              Text(
                "Show all",
                style: TextStyle(fontSize: 14, color: Color(0xFF7FA893)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 170,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: priceOfWeek.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, i) {
                final product = priceOfWeek[i];
                return GestureDetector(
                  onTap: () {
                    // Arahkan ke Product Detail (misal ProductDetailScreen)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => ProductDetailScreen(
                              image: product['image']!,
                              name: product['name']!,
                              price:
                                  'Rp 20.000', // Bisa ambil dari data produk aslinya
                              description:
                                  'Obat pereda nyeri dan demam, cocok untuk semua usia.',
                              dosage: '500 mg',
                              instruction:
                                  'Minum 1 tablet setelah makan, maksimal 3x sehari.',
                            ),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F5F7),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            product['image']!,
                            fit: BoxFit.contain,
                            errorBuilder:
                                (_, __, ___) => Icon(
                                  Icons.medical_services,
                                  size: 52,
                                  color: Colors.grey[300],
                                ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          product['name']!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}

// Product detail screen dummy, ganti sesuai kebutuhanmu
class ProductDetailScreen extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String description;
  final String dosage;
  final String instruction;
  const ProductDetailScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.dosage,
    required this.instruction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: const Color(0xFFA8D5BA),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: 180),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              price,
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description:",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Dosage:",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dosage,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Instruction:",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    instruction,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
