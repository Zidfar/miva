import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  // Data pesanan, apotik, dan user bisa dioper dari cart atau lewat provider
  // Untuk mockup, kita hardcode dulu
  final List<Map<String, dynamic>> products;
  final Map<String, String> apotik;
  final Map<String, String> user;

  const OrderConfirmationScreen({
    super.key,
    required this.products,
    required this.apotik,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    int total = products.fold(0, (prev, p) => prev + (p['price'] as int));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Konfirmasi Pesanan"),
        backgroundColor: const Color(0xFFA8D5BA),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text(
            "Detail Pesanan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
          const SizedBox(height: 16),
          ...products.map(
            (p) => Card(
              margin: const EdgeInsets.symmetric(vertical: 7),
              child: ListTile(
                leading: Image.asset(p['image'], width: 50, height: 50),
                title: Text(p['name']),
                subtitle: Text("Jumlah: ${p['qty']}"),
                trailing: Text("Rp ${p['price']}"),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.local_pharmacy, color: Color(0xFF7FA893)),
            title: Text(apotik['name'] ?? ''),
            subtitle: Text("${apotik['address']}"),
            trailing: Text(apotik['distance'] ?? ''),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_outline, color: Color(0xFF7FA893)),
            title: Text(user['name'] ?? ''),
            subtitle: Text(user['email'] ?? ''),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              Text(
                "Rp $total",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.check),
              label: const Text("Konfirmasi & Ambil di Apotik"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7FA893),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        title: const Text("Pesanan Berhasil!"),
                        content: const Text(
                          "Silakan datang ke apotik pilihan Anda untuk mengambil obat.",
                        ),
                        actions: [
                          TextButton(
                            child: const Text("OK"),
                            onPressed: () {
                              Navigator.pop(context); // close dialog
                              Navigator.pop(context); // back to home/order
                            },
                          ),
                        ],
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
