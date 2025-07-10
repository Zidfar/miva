import 'package:flutter/material.dart';

class ApotikScreen extends StatelessWidget {
  const ApotikScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data apotik
    final List<Map<String, String>> apotiks = [
      {
        'name': 'Apotek Sehat Selalu',
        'address': 'Jl. Mawar No. 1, Cirebon',
        'open': '08.00 - 21.00',
        'distance': '1.2 km',
      },
      {
        'name': 'Apotek Keluarga',
        'address': 'Jl. Anggrek No. 21, Cirebon',
        'open': '07.00 - 22.00',
        'distance': '2.4 km',
      },
      {
        'name': 'Apotek Cendekia',
        'address': 'Jl. Merpati No. 99, Cirebon',
        'open': '09.00 - 20.00',
        'distance': '3.0 km',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih Apotik"),
        backgroundColor: const Color(0xFFA8D5BA),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(18),
        itemCount: apotiks.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, i) {
          final a = apotiks[i];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 2,
            child: ListTile(
              leading: const Icon(
                Icons.local_pharmacy,
                color: Color(0xFF7FA893),
                size: 36,
              ),
              title: Text(
                a['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(a['address']!),
                  Text("Jam buka: ${a['open']}"),
                  Text(
                    "Jarak: ${a['distance']}",
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, a);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7FA893),
                  foregroundColor: Colors.white,
                ),
                child: const Text("Pilih"),
              ),
            ),
          );
        },
      ),
    );
  }
}
