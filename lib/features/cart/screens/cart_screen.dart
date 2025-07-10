import 'package:flutter/material.dart';
import 'package:miva/features/apotik/screens/apotik_screen.dart';
import 'package:miva/features/order/screens/order_confirmation_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Mock data produk cart
  List<Map<String, dynamic>> cart = [
    {
      'image': 'assets/images/paracetamol.png',
      'name': 'Paracetamol',
      'price': 20000,
      'qty': 1,
    },
    {
      'image': 'assets/images/vitamin_c.png',
      'name': 'Vitamin C',
      'price': 18000,
      'qty': 2,
    },
  ];

  int get total =>
      cart.fold(0, (sum, item) => sum + ((item['price'] * item['qty']) as int));

  void updateQty(int index, int change) {
    setState(() {
      cart[index]['qty'] += change;
      if (cart[index]['qty'] <= 0) cart.removeAt(index);
    });
  }

  void removeItem(int index) {
    setState(() {
      cart.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return cart.isEmpty
        ? const Center(
          child: Text("Cart masih kosong.", style: TextStyle(fontSize: 18)),
        )
        : Scaffold(
          body: ListView.separated(
            padding: const EdgeInsets.all(18),
            itemCount: cart.length,
            separatorBuilder: (_, __) => const SizedBox(height: 14),
            itemBuilder: (context, i) {
              final item = cart[i];
              return Container(
                padding: const EdgeInsets.all(12),
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      item['image'],
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
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Rp ${item['price']}",
                            style: const TextStyle(color: Color(0xFF7FA893)),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () => updateQty(i, -1),
                              ),
                              Text('${item['qty']}'),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () => updateQty(i, 1),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      color: Colors.redAccent,
                      onPressed: () => removeItem(i),
                    ),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: Rp $total",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Navigasi ke ApotikScreen, dan dapatkan apotik yang dipilih
                    final selectedApotik = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ApotikScreen()),
                    );
                    if (selectedApotik != null) {
                      // Navigasi ke OrderConfirmationScreen, kirim data cart dan apotik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => OrderConfirmationScreen(
                                cart: cart,
                                apotik: selectedApotik,
                              ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7FA893),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Proses"),
                ),
              ],
            ),
          ),
        );
  }
}
