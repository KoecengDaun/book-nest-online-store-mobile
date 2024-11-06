# book_nest_online_store

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## TUGAS 7

1. **Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.**

   - **Stateless Widget** adalah widget yang tidak memiliki "state" atau kondisi yang berubah-ubah. Dengan kata lain, widget ini bersifat statis setelah dirender dan tidak dapat berubah seiring waktu atau interaksi. Contoh dari `StatelessWidget` adalah `Text` dan `Icon`.
   
   - **Stateful Widget** adalah widget yang memiliki "state" atau kondisi yang bisa berubah selama waktu atau berdasarkan interaksi pengguna. Widget ini memanfaatkan `State` untuk mengelola data yang bisa berubah. Contoh dari `StatefulWidget` adalah widget seperti `Checkbox` atau `Slider` yang memungkinkan perubahan.

   - **Perbedaan utama:** `StatelessWidget` bersifat statis, sementara `StatefulWidget` dinamis dan dapat berubah.

2. **Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.**

   - **Scaffold**: Merupakan struktur dasar dari tampilan, menyediakan AppBar, body, dan SnackBar.
   - **Container**: Digunakan untuk membuat kotak atau area dengan dekorasi, seperti warna latar belakang dan radius sudut.
   - **Column**: Memposisikan widget-widget secara vertikal.
   - **Row**: Memposisikan widget-widget secara horizontal.
   - **SafeArea**: Melindungi konten dari area yang mungkin tertutup oleh layar atau notch.
   - **Text**: Untuk menampilkan teks statis.
   - **Icon**: Untuk menampilkan ikon di layar.
   - **ElevatedButton**: Tombol yang digunakan untuk memberikan aksi dan umpan balik saat ditekan.
   - **SnackBar**: Menampilkan pesan sementara di layar untuk memberikan umpan balik pada pengguna.

3. **Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.**

   - `setState()` adalah metode pada `StatefulWidget` yang digunakan untuk memberi tahu Flutter bahwa "state" dari widget tersebut telah berubah, sehingga memicu proses build ulang widget agar perubahan terlihat.
   - Variabel-variabel yang terdampak adalah variabel yang dideklarasikan di dalam kelas `State` dan diubah di dalam metode `setState()`.

4. **Jelaskan perbedaan antara const dengan final.**

   - **const** digunakan untuk mendeklarasikan nilai yang bersifat konstan pada waktu kompilasi dan tidak dapat diubah sama sekali.
   - **final** digunakan untuk mendeklarasikan variabel yang nilainya diinisialisasi sekali dan tidak bisa diubah lagi, tetapi nilainya bisa ditentukan pada runtime.

5. **Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.**

   - Saya telah membuat `MenuPage` menggunakan `StatelessWidget` karena halaman ini hanya menampilkan UI statis tanpa perubahan kondisi dinamis.
   - Saya menggunakan `Scaffold` dan `Container` untuk struktur layout, serta `Column` dan `Row` untuk mengatur tata letak elemen-elemen di dalamnya.
   - Tiga tombol dengan `ElevatedButton` telah diimplementasikan untuk navigasi menu, dengan fungsi snackbar yang menampilkan pesan umpan balik