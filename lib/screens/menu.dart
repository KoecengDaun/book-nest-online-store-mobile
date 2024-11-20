// lib/screens/menu_page.dart
import 'package:flutter/material.dart';
import 'package:book_nest_online_store/widgets/left_drawer.dart';
import 'package:book_nest_online_store/widgets/book_card.dart'; // Import BookCard

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    // Daftar menu menggunakan BookItem dengan warna berbeda
    final List<BookItem> menuItems = [
      BookItem(
        "Lihat Daftar Produk",
        Icons.inventory_2_rounded,
        Colors.redAccent, // Warna merah
      ),
      BookItem(
        "Tambah Produk",
        Icons.add_shopping_cart_rounded,
        Colors.greenAccent, // Warna hijau
      ),
      BookItem(
        "Logout",
        Icons.logout_rounded,
        Colors.blueAccent, // Warna biru
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Nest Online Store'),
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      drawer: const LeftDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryColor.withOpacity(0.9),
              secondaryColor.withOpacity(0.7),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(primaryColor, secondaryColor),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Menggunakan 2 kolom
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 24,
                      childAspectRatio: 1, // Menjaga rasio aspek agar kartu persegi
                    ),
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      return BookCard(menuItems[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Color primaryColor, Color secondaryColor) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.shopping_cart_rounded,
              size: 36,
              color: primaryColor,
            ),
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book Nest Online Store',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Selamat datang di aplikasi ini',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
