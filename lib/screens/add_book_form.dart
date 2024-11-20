import 'package:flutter/material.dart';
import 'package:book_nest_online_store/screens/menu.dart';
import 'dart:convert';
//import 'package:book_nest_online_store/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';


class AddBookFormPage extends StatefulWidget {
  const AddBookFormPage({super.key});

  @override
  State<AddBookFormPage> createState() => _AddBookFormPageState();
}

class _AddBookFormPageState extends State<AddBookFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _author = "";
  String _genre = "";
  int _publicationYear = 0;
  int _stock = 0;
  String? _isbn;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Produk Baru',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MenuPage(),
              ),
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor.withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Text(
                    'Informasi Produk',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                // Input Fields
                _buildInputField(
                  label: "Nama Produk",
                  icon: Icons.book,
                  onChanged: (value) => setState(() => _name = value),
                  validator: (value) => value == null || value.isEmpty
                      ? "Nama produk tidak boleh kosong!"
                      : null,
                  hint: "Masukkan nama buku",
                ),
                _buildInputField(
                  label: "Harga",
                  icon: Icons.attach_money,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => _price = int.tryParse(value) ?? 0),
                  validator: (value) => value == null || int.tryParse(value) == null
                      ? "Masukkan harga yang valid!"
                      : null,
                  hint: "Masukkan harga produk",
                ),
                _buildInputField(
                  label: "Deskripsi",
                  icon: Icons.description_outlined,
                  maxLines: 3,
                  onChanged: (value) => setState(() => _description = value),
                  validator: (value) => value == null || value.isEmpty
                      ? "Deskripsi tidak boleh kosong!"
                      : null,
                  hint: "Tuliskan deskripsi buku",
                ),
                _buildInputField(
                  label: "Penulis",
                  icon: Icons.person,
                  onChanged: (value) => setState(() => _author = value),
                  validator: (value) => value == null || value.isEmpty
                      ? "Nama penulis tidak boleh kosong!"
                      : null,
                  hint: "Masukkan nama penulis",
                ),
                _buildInputField(
                  label: "Genre",
                  icon: Icons.category,
                  onChanged: (value) => setState(() => _genre = value),
                  validator: (value) => value == null || value.isEmpty
                      ? "Genre tidak boleh kosong!"
                      : null,
                  hint: "Masukkan genre buku",
                ),
                _buildInputField(
                  label: "Tahun Publikasi",
                  icon: Icons.calendar_today,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => _publicationYear = int.tryParse(value) ?? 0),
                  validator: (value) => value == null || int.tryParse(value) == null
                      ? "Masukkan tahun publikasi yang valid!"
                      : null,
                  hint: "Masukkan tahun publikasi",
                ),
                _buildInputField(
                  label: "Stok",
                  icon: Icons.inventory,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => _stock = int.tryParse(value) ?? 0),
                  validator: (value) => value == null || int.tryParse(value) == null
                      ? "Masukkan jumlah stok yang valid!"
                      : null,
                  hint: "Masukkan jumlah stok",
                ),
                _buildInputField(
                  label: "ISBN",
                  icon: Icons.bookmark,
                  onChanged: (value) => setState(() => _isbn = value),
                  hint: "Masukkan ISBN (opsional)",
                  validator: (value) {
                    if (value != null && value.isNotEmpty && value.length != 13) {
                      return "ISBN harus terdiri dari 13 karakter!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                // Save Button
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [primaryColor, secondaryColor],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Kirim ke Django dan tunggu respons
                        // Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                        final response = await request.postJson(
                          "http://localhost:8000/create-flutter/",
                          jsonEncode(<String, dynamic>{
                            'name': _name,
                            'price': _price.toString(),
                            'description': _description,
                            'author': _author,
                            'genre': _genre,
                            'publication_year': _publicationYear.toString(),
                            'stock': _stock.toString(),
                            'isbn': _isbn ?? '', // Gunakan string kosong jika ISBN null
                          }),
                        );

                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Produk baru berhasil disimpan!")),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const MenuPage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Terdapat kesalahan, silakan coba lagi."),
                              ),
                            );
                          }
                        }
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    required void Function(String) onChanged,
    String? Function(String?)? validator,
    required String hint,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
              prefixIcon: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(16),
            ),
            keyboardType: keyboardType,
            maxLines: maxLines,
            onChanged: onChanged,
            validator: validator,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildInfoRow(String label, String value) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 4),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           label,
  //           style: const TextStyle(
  //             fontWeight: FontWeight.bold,
  //             color: Colors.grey,
  //             fontSize: 14,
  //           ),
  //         ),
  //         const SizedBox(height: 4),
  //         Text(
  //           value,
  //           style: const TextStyle(
  //             fontSize: 16,
  //             color: Colors.black87,
  //           ),
  //         ),
  //         const Divider(height: 16),
  //       ],
  //     ),
  //   );
  // }
}
