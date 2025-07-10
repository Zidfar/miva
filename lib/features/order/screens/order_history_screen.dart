import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Contoh data mock order history
    final List<Map<String, dynamic>> orders = [
      {
        'id': 'INV-001',
        'date': '2024-07-06',
        'apotik': 'Apotek Sehat Selalu',
        'status': 'Sudah Diambil',
        'items': [
          {'name': 'Paracetamol', 'qty': 1, 'price': 20000},
          {'name': 'Vitamin C', 'qty': 2, 'price': 18000},
        ],
      },
      {
        'id': 'INV-002',
        'date': '2024-07-05',
        'apotik': 'Apotek Keluarga',
        'status': 'Menunggu Pengambilan',
        'items': [
          {'name': 'OBH Batuk', 'qty': 1, 'price': 15000},
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Pesanan"),
        backgroundColor: const Color(0xFFA8D5BA),
      ),
      body:
          orders.isEmpty
              ? const Center(child: Text("Belum ada riwayat pesanan."))
              : ListView.builder(
                itemCount: orders.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, i) {
                  final order = orders[i];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        order['id'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tanggal: ${order['date']}"),
                          Text("Apotik: ${order['apotik']}"),
                          Text(
                            "Status: ${order['status']}",
                            style: TextStyle(
                              color:
                                  order['status'] == "Sudah Diambil"
                                      ? Colors.green
                                      : Colors.orange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text("Pesanan:"),
                          ...List.generate(order['items'].length, (j) {
                            final item = order['items'][j];
                            return Text(
                              "• ${item['name']} x${item['qty']} (Rp ${item['price']})",
                              style: const TextStyle(fontSize: 13),
                            );
                          }),
                        ],
                      ),
                      onTap: () {
                        // OPTIONAL: Tampilkan detail order jika perlu
                        showDialog(
                          context: context,
                          builder:
                              (_) => AlertDialog(
                                title: Text("Detail Pesanan ${order['id']}"),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Tanggal: ${order['date']}"),
                                    Text("Apotik: ${order['apotik']}"),
                                    const SizedBox(height: 10),
                                    const Text("Pesanan:"),
                                    ...List.generate(order['items'].length, (
                                      j,
                                    ) {
                                      final item = order['items'][j];
                                      return Text(
                                        "- ${item['name']} x${item['qty']} (Rp ${item['price']})",
                                      );
                                    }),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Status: ${order['status']}",
                                      style: TextStyle(
                                        color:
                                            order['status'] == "Sudah Diambil"
                                                ? Colors.green
                                                : Colors.orange,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text("Tutup"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                        );
                      },
                    ),
                  );
                },
              ),
    );
  }
}
