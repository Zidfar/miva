import 'package:flutter/material.dart';
import '../controllers/wishlist_controller.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final wish = WishlistController.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        backgroundColor: const Color(0xFFA8D5BA),
      ),
      body:
          wish.wishlist.isEmpty
              ? const Center(child: Text('Belum ada produk favorit'))
              : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: wish.wishlist.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, i) {
                  final item = wish.wishlist[i];
                  return ListTile(
                    leading: Image.asset(
                      item['image'],
                      width: 48,
                      height: 48,
                      fit: BoxFit.contain,
                    ),
                    title: Text(item['name']),
                    subtitle: Text('Rp ${item['price']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          wish.toggleWishlist(item);
                        });
                      },
                    ),
                  );
                },
              ),
    );
  }
}
