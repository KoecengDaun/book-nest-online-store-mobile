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

## Tugas 9

### 1. Mengapa Kita Perlu Membuat Model untuk Pengambilan/Pengiriman Data JSON?
Model dalam framework seperti Django sangat penting untuk mengelola data yang akan diambil atau dikirim dalam format JSON. Model bertindak sebagai representasi dari struktur data yang akan disimpan di database, yang mempermudah serialisasi dan deserialisasi data untuk operasi CRUD (Create, Read, Update, Delete). 

- **Tanpa Model**: Jika kita tidak membuat model terlebih dahulu, kita akan kesulitan mengatur struktur data yang akan disimpan atau dikirim ke dan dari database. Selain itu, pengambilan atau pengiriman data JSON yang tidak terstruktur dapat menyebabkan error karena backend tidak dapat memvalidasi data dengan baik.
- **Kesimpulan**: Model membantu memastikan bahwa data yang dikirim dan diterima memiliki struktur yang konsisten, memudahkan validasi, dan meminimalkan kesalahan.

### 2. Fungsi dari Library `http`
Library `http` di Flutter digunakan untuk melakukan permintaan HTTP, seperti GET, POST, PUT, dan DELETE, ke server backend. Di dalam proyek ini, `http` digunakan untuk:
- **Mengambil Data**: Melakukan permintaan GET untuk mengambil daftar produk dari server Django dalam format JSON.
- **Mengirim Data**: Melakukan permintaan POST untuk mengirim data seperti informasi produk baru yang ingin disimpan ke server Django.
- **Mengelola Respons**: Menerima dan memproses respons dari server, baik itu data dalam format JSON atau pesan status.

Library ini sangat penting untuk menghubungkan aplikasi Flutter dengan server backend dan melakukan komunikasi yang efisien.

### 3. Fungsi dari `CookieRequest`
`CookieRequest` adalah library khusus yang digunakan untuk menangani sesi dan cookie di Flutter, memungkinkan aplikasi untuk menjaga status autentikasi pengguna.
- **Fungsi Utama**: `CookieRequest` memungkinkan aplikasi Flutter untuk menyimpan dan mengelola cookie dari backend Django, yang digunakan untuk mengautentikasi dan mengidentifikasi pengguna selama sesi.
- **Pentingnya Membagikan Instance**: Karena status autentikasi dan informasi sesi pengguna perlu diakses oleh berbagai komponen aplikasi, instance `CookieRequest` harus dibagikan ke seluruh aplikasi Flutter. Dengan begitu, semua bagian aplikasi dapat mengakses status login pengguna, mengirim data yang memerlukan autentikasi, dan menjaga informasi sesi secara aman.

### 4. Mekanisme Pengiriman Data dari Input hingga Ditampilkan di Flutter
Mekanisme pengiriman data melibatkan beberapa langkah:
1. **Input Data di Flutter**: Pengguna mengisi formulir dan menekan tombol untuk mengirim data.
2. **Menggunakan `CookieRequest`**: Data dari formulir diubah menjadi format JSON, lalu dikirim ke server Django menggunakan `CookieRequest`.
3. **Backend Django**: Django memproses data, memvalidasinya, dan menyimpannya di database jika valid. Respons berupa data JSON atau pesan status dikirim kembali ke Flutter.
4. **Menampilkan Data di Flutter**: Aplikasi Flutter menerima respons dari Django dan menampilkannya di antarmuka pengguna.

### 5. Mekanisme Autentikasi (Login, Register, Logout)
1. **Register**: Pengguna mengisi formulir pendaftaran di Flutter. Data dikirim ke endpoint `/register/` di Django, yang membuat akun baru jika data valid.
2. **Login**: Pengguna memasukkan kredensial login di Flutter. Data dikirim ke `/login/` di Django, yang memeriksa kredensial dan mengembalikan cookie sesi jika berhasil. Cookie ini disimpan oleh `CookieRequest`.
3. **Autentikasi Django**: Django menggunakan cookie untuk menjaga sesi pengguna. Jika pengguna melakukan permintaan lain (seperti melihat produk), cookie dikirimkan untuk memverifikasi status login.
4. **Logout**: Ketika pengguna logout, cookie sesi dihapus di Django dan `CookieRequest` di Flutter juga menghapus informasi sesi, mengakhiri autentikasi.

### 6. Implementasi Checklist Secara Step-by-Step
1. **Membuat Model di Django**: Saya mulai dengan membuat model `Product` di Django untuk mengelola data produk. Model ini memiliki atribut seperti nama, harga, deskripsi, dan pemilik.
2. **Endpoint untuk JSON**: Saya membuat view di Django untuk mengembalikan data produk dalam format JSON, kemudian menghubungkannya dengan URL patterns.
3. **Mengatur Autentikasi**: Saya menyiapkan pendaftaran, login, dan logout dengan formulir Django dan view yang memproses data pengguna.
4. **Membuat Formulir di Flutter**: Saya membuat halaman input produk baru di Flutter menggunakan widget Form dan TextFormField.
5. **Menghubungkan dengan Backend**: Menggunakan `http` dan `CookieRequest` untuk mengirim dan menerima data dari Django, memastikan cookie dan sesi bekerja dengan baik.
6. **Menggunakan FutureBuilder**: Saya menggunakan FutureBuilder di Flutter untuk menampilkan data produk yang diambil dari server, dengan indikator loading hingga data berhasil dimuat.
