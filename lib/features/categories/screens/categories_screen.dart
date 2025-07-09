import 'package:flutter/material.dart';
import '../../product/screens/product_detail_screen.dart'; // pastikan path benar

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  // Daftar kategori (mock)
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.medical_services, 'label': 'Medicine'},
    {'icon': Icons.vaccines, 'label': 'Vitamin'},
    {'icon': Icons.spa, 'label': 'Beauty'},
    {'icon': Icons.favorite, 'label': 'Health'},
    {'icon': Icons.fitness_center, 'label': 'Suplemen'},
    {'icon': Icons.sports_mma, 'label': 'Olahraga'},
  ];

  // Produk per kategori (mock)
  final Map<String, List<Map<String, String>>> productsByCategory = {
    'Medicine': [
      {
        'image': 'assets/images/paracetamol.png',
        'name': 'Paracetamol',
        'price': 'Rp 20.000',
      },
      {
        'image': 'assets/images/ibuprofen.png',
        'name': 'Ibuprofen',
        'price': 'Rp 25.000',
      },
    ],
    'Vitamin': [
      {
        'image': 'assets/images/vitamin_c.png',
        'name': 'Vitamin C',
        'price': 'Rp 18.000',
      },
      {
        'image': 'assets/images/vitamin_d.png',
        'name': 'Vitamin D',
        'price': 'Rp 23.000',
      },
    ],
    'Beauty': [
      {
        'image': 'assets/images/face_mask.png',
        'name': 'Face Mask',
        'price': 'Rp 15.000',
      },
    ],
    'Health': [
      {
        'image': 'assets/images/thermometer.png',
        'name': 'Thermometer',
        'price': 'Rp 60.000',
      },
    ],
    'Suplemen': [
      {
        'image': 'assets/images/protein.png',
        'name': 'Protein Powder',
        'price': 'Rp 95.000',
      },
    ],
    'Olahraga': [
      {
        'image': 'assets/images/yoga_mat.png',
        'name': 'Yoga Mat',
        'price': 'Rp 70.000',
      },
    ],
  };

  String selectedCategory = 'Medicine';
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final products =
        productsByCategory[selectedCategory]!
            .where(
              (p) =>
                  p['name']!.toLowerCase().contains(searchText.toLowerCase()),
            )
            .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar diatur oleh MainNavigation, jadi di sini tidak perlu AppBar
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari produk...",
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: const Color(0xFFF3F4F6),
              ),
              onChanged: (val) {
                setState(() {
                  searchText = val;
                });
              },
            ),
          ),
          // Kategori
          SizedBox(
            height: 78,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, i) {
                final isActive = categories[i]['label'] == selectedCategory;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[i]['label'];
                      searchText = '';
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color:
                              isActive
                                  ? const Color(0xFF7FA893)
                                  : const Color(0xFFF3F4F6),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          categories[i]['icon'] as IconData,
                          size: 28,
                          color: isActive ? Colors.white : Colors.black38,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        categories[i]['label'],
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              isActive
                                  ? const Color(0xFF7FA893)
                                  : Colors.black87,
                          fontWeight:
                              isActive ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 18),
          // Produk list
          Expanded(
            child:
                products.isEmpty
                    ? const Center(child: Text("Produk tidak ditemukan"))
                    : GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 18,
                            crossAxisSpacing: 18,
                            childAspectRatio: 0.74,
                          ),
                      itemCount: products.length,
                      itemBuilder: (ctx, i) {
                        final product = products[i];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => ProductDetailScreen(
                                      image: product['image']!,
                                      name: product['name']!,
                                      price: product['price']!,
                                      description:
                                          'Deskripsi produk akan tampil di sini.',
                                      dosage: '500 mg',
                                      instruction:
                                          'Gunakan sesuai anjuran dokter/apoteker.',
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
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
                                const SizedBox(height: 8),
                                Text(
                                  product['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  product['price']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Color(0xFF7FA893),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
      // BottomNavigationBar diatur oleh MainNavigation, jadi di sini tidak perlu BottomNavigationBar
    );
  }
}
