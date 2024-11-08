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

## TUGAS 8

### 1. Apa kegunaan `const` di Flutter?
`const` digunakan untuk mendefinisikan objek yang bersifat konstan dan tidak berubah selama runtime. Saat kamu menggunakan `const`, Flutter dapat mengoptimalkan penggunaan memori dengan menciptakan objek tersebut hanya sekali dan menggunakan kembali referensi yang sama setiap kali objek itu dibutuhkan.

**Keuntungan Menggunakan `const`**:
- **Optimasi Performa**: Objek yang didefinisikan sebagai `const` hanya dibuat sekali, sehingga mengurangi overhead dalam pembuatan ulang objek selama runtime.
- **Penggunaan Memori yang Efisien**: Flutter menggunakan memoization untuk berbagi objek `const` yang sama di berbagai tempat dalam aplikasi, yang menghemat penggunaan memori.

**Kapan Sebaiknya Menggunakan `const`**:
- Gunakan `const` pada widget atau objek yang tidak pernah berubah, seperti teks statis, ikon tetap, atau dekorasi tetap.
- Hindari penggunaan `const` jika nilai atau objek tersebut akan berubah selama runtime, misalnya pada elemen yang terpengaruh oleh state yang dinamis.

### 2. Jelaskan dan Bandingkan Penggunaan `Column` dan `Row`
`Column` dan `Row` adalah widget layout di Flutter yang digunakan untuk menyusun anak-anak widget dalam arah vertikal dan horizontal.

- **Column**: Menyusun widget dalam arah vertikal dari atas ke bawah. Biasanya digunakan untuk membuat tata letak vertikal.
  ```dart
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Item 1'),
      Text('Item 2'),
      Text('Item 3'),
    ],
  )
  ```
  
- **Row**: Menyusun widget dalam arah horizontal dari kiri ke kanan. Cocok digunakan untuk membuat tata letak horizontal.
  ```dart
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(Icons.home),
      Icon(Icons.search),
      Icon(Icons.settings),
    ],
  )
  ```

**Perbedaan Utama**:
- **Column** digunakan untuk menyusun widget secara vertikal, sedangkan **Row** digunakan untuk menyusun widget secara horizontal.
- `mainAxisAlignment` mengatur tata letak di sepanjang sumbu utama (vertikal untuk `Column` dan horizontal untuk `Row`).
- `crossAxisAlignment` mengatur tata letak di sepanjang sumbu sekunder (horizontal untuk `Column` dan vertikal untuk `Row`).

### 3. Elemen Input yang Digunakan pada Halaman Form
Pada halaman form yang saya buat, saya menggunakan beberapa elemen input berikut:
- **TextFormField**: Untuk memasukkan nama dan deskripsi produk.
- **TextFormField (keyboardType: TextInputType.number)**: Untuk memasukkan jumlah produk dengan tipe angka.

**Elemen Input Flutter Lain yang Tidak Digunakan**:
- **DropdownButton**: Digunakan untuk menampilkan daftar pilihan dalam bentuk dropdown.
- **Checkbox**: Digunakan untuk pilihan biner (true/false).
- **Switch**: Digunakan untuk pilihan biner dengan gaya sakelar.
- **Slider**: Digunakan untuk memilih nilai dalam rentang yang ditentukan.
  
Saya tidak menggunakan elemen-elemen tersebut karena form saya tidak memerlukan input dalam bentuk pilihan atau sakelar.

### 4. Pengaturan Tema (Theme) dalam Aplikasi Flutter
Untuk mengatur tema dalam aplikasi Flutter, saya menggunakan widget `ThemeData` di dalam `MaterialApp`. Ini memungkinkan saya untuk mengatur warna utama, warna sekunder, font, dan gaya lainnya agar aplikasi terlihat konsisten.

**Implementasi Tema**:
```dart
MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  home: MenuPage(),
);
```
Ya, saya mengimplementasikan tema dalam aplikasi untuk memastikan semua halaman menggunakan skema warna dan gaya yang seragam.

### 5. Menangani Navigasi dalam Aplikasi dengan Banyak Halaman
Untuk menangani navigasi dalam aplikasi yang memiliki banyak halaman, saya menggunakan widget `Navigator` dan metode seperti `Navigator.push` dan `Navigator.pushReplacement`. Ini memungkinkan saya untuk berpindah antar halaman dan mengontrol apakah pengguna bisa kembali ke halaman sebelumnya atau tidak.

**Contoh Navigasi**:
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => AddBookFormPage()),
);
```
- **Navigator.push**: Menambahkan halaman baru ke tumpukan navigasi.
- **Navigator.pushReplacement**: Mengganti halaman saat ini dengan halaman baru, mencegah pengguna kembali ke halaman sebelumnya.

Menggunakan drawer untuk navigasi juga membantu pengguna menjelajahi halaman-halaman utama dengan mudah.
