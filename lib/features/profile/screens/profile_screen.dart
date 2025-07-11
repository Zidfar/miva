import 'package:flutter/material.dart';
import '../../reminder/screens/reminder_screen.dart'; // jika sudah dibuat
import '../../wishlist/screens/wishlist_screen.dart'; // jika sudah dibuat
import '../../auth/screens/welcome_screen.dart'; // untuk logout
import 'package:miva/core/services/auth_service.dart';
import '../../order/screens/order_history_screen.dart'; // <--- Tambahkan ini

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock user data
    final user = {
      'name': 'Agus Lawud',
      'email': 'aguslawud@gmail.com',
      'dob': '1999-10-21',
      'address': 'Cirebon, Jawa Barat',
    };

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 38,
                backgroundColor: const Color(0xFF7FA893),
                child: const Icon(Icons.person, size: 38, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                user['name']!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _profileField("Email", user['email']!),
            _profileField("Tanggal Lahir", user['dob']!),
            _profileField("Alamat", user['address']!),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.history, color: Color(0xFF7FA893)),
              title: const Text("Riwayat Pesanan"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrderHistoryScreen()),
                );
              },
            ),
            const SizedBox(height: 8),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.alarm, color: Color(0xFF7FA893)),
              title: const Text("Reminder Obat"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ReminderScreen()),
                );
              },
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite_border,
                color: Color(0xFF7FA893),
              ),
              title: const Text("Wishlist / Favorite"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const WishlistScreen()),
                );
              },
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(),
            const SizedBox(height: 12),
            Center(
              child: ElevatedButton.icon(
                onPressed: () async {
                  await AuthService.logout();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[400],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 4),
      child: Row(
        children: [
          SizedBox(
            width: 108,
            child: Text(label, style: const TextStyle(color: Colors.black54)),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
