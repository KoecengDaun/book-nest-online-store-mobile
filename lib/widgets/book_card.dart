// lib/widgets/book_card.dart
import 'package:flutter/material.dart';
import 'package:book_nest_online_store/screens/add_book_form.dart';
import 'package:book_nest_online_store/screens/list_product.dart';
import 'package:book_nest_online_store/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class BookItem {
  final String name;
  final IconData icon;
  final Color color; // Menambahkan properti warna

  BookItem(this.name, this.icon, this.color);
}

class BookCard extends StatelessWidget {
  final BookItem item;

  const BookCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final request = context.watch<CookieRequest>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            item.color,
            item.color.withOpacity(0.8),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: item.color.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            // Menampilkan Snackbar
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Icon(
                        item.icon,
                        color: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Kamu telah menekan tombol ${item.name}!",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: primaryColor,
                  duration: const Duration(seconds: 2),
                  elevation: 4,
                  margin: const EdgeInsets.all(12),
                ),
              );

            // Navigasi berdasarkan tombol yang ditekan
            if (item.name == "Tambah Produk") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddBookFormPage(),
                ),
              );
            } else if (item.name == "Lihat Daftar Produk") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductPage(),
                ),
              );
            } else if (item.name == "Logout") {
              final response = await request.logout(
                "http://localhost:8000/auth/logout/",
              );
              String message = response["message"];
              if (context.mounted) {
                if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$message Sampai jumpa, $uname."),
                  ));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                }
              }
            }
          },
          borderRadius: BorderRadius.circular(20),
          splashColor: Colors.white.withOpacity(0.1),
          highlightColor: Colors.white.withOpacity(0.05),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container untuk icon dengan efek lingkaran
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 42.0,
                  ),
                ),
                const SizedBox(height: 16),
                // Text dengan efek shadow
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Subtitle berdasarkan jenis tombol
                Text(
                  _getSubtitle(item.name),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getSubtitle(String name) {
    switch (name) {
      case "Tambah Produk":
        return "Tambahkan buku baru ke katalog";
      case "Lihat Daftar Produk":
        return "Kelola inventaris buku Anda";
      case "Logout":
        return "Keluar dari akun";
      default:
        return "";
    }
  }
}
