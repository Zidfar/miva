import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cart;
  final Map<String, String> apotik;
  const OrderConfirmationScreen({
    super.key,
    required this.cart,
    required this.apotik,
  });

  @override
  Widget build(BuildContext context) {
    int total = cart.fold(
      0,
      (sum, item) => sum + ((item['price'] * item['qty']) as int),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi Pesanan'),
        backgroundColor: const Color(0xFFA8D5BA),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Apotik:",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(apotik['name'] ?? ''),
            Text(apotik['address'] ?? ''),
            const SizedBox(height: 14),
            const Text("Pesanan:"),
            ...cart.map(
              (item) =>
                  Text("${item['name']} x${item['qty']} (Rp ${item['price']})"),
            ),
            const Divider(height: 30),
            Text(
              "Total: Rp $total",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Simulasi: Tambahkan ke order history (nanti storage beneran)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pesanan berhasil dikonfirmasi!'),
                    ),
                  );
                  // Navigasi ke Home/Profile/History, atau pop sampai ke Home
                  Navigator.popUntil(context, (route) => route.isFirst);
                  // Atau arahkan ke OrderHistoryScreen jika mau
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => OrderHistoryScreen()),
                  //   (route) => false,
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7FA893),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Konfirmasi Pesanan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
