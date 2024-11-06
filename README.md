# E-Jersey-Mobile
---
<br>
Nama    : Muhammad Naufal Ramadhan <br>
NPM     : 2306241700 <br>
Kelas   : D <br>

Link Web : http://muhammad-naufal324-ejersey.pbp.cs.ui.ac.id/
<br>

---
<details>
<summary>
Tugas 7
</summary>

##### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
  Stateless Widget adalah widget yang tidak memiliki state, bisa dibilang sebuah widget yang statis atau sekalinya dibuat, maka widget tersebut tidak akan berubah. Sedangkan Stateful widget adalah widget yang memiliki state, bisa dibilang adalah sebuah widget yang memiliki state internal, contohnya seperti widget counter ketika inisialiasi projek flutter.
##### 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
  Pada `main.dart` terdapat widget `MyApp` yang berfungsi sebagai widget utama di aplikasi saya. selanjutnya pada widget `menu.dart` terdapat widget MyHomePage yang berfungsi sebagai halaman utama atau homepage pada aplikasi saya. Kemudian terdapat widget `InfoCard` yang berfungsi untuk menyimpan dan menampilkan card informasi dengan judul dan kontennya seperti Nama, NPM. kemudian terdapat widget `ItemHomePage` yang berfungsi untuk menyimpan data sementara yang mungkin akan di convert ke widget lain. `ItemCard` berfungsi untuk menampilkan card atau pada app ini berperan sebagai button.
  
##### 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
  Fungsi dari setState untuk mengubah internal state dari StatefulWidget, dan akan membuild ulang widget nya sehingga berubah menjadi yang terbaru.  Untuk variable yang dapat terdampak, ya semua variable yang terdapat di widget tersebut dapat kita ubah sesuai keinginan kita.
##### 4. Jelaskan perbedaan antara const dengan final.
  Perbedaan const dan final terletak dari deklarasi value dari variabelnya, kalau const harus diisi dengan nilai tetap dan sudah ready pada saat compile-time. Sedangkan value dari variabel final dapat ditentukan saat run-time. contoh const x = 10; final y = getDate();
##### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
##### 1). Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
menjalankan `flutter create <APP_NAME>` pada terminal.
##### 2). Membuat tiga tombol sederhana dengan ikon dan teks untuk: Melihat daftar produk (Lihat Daftar Produk), Menambah produk (Tambah Produk), Logout (Logout)
Pertama di inisialisasi dahulu button nya dengan class ItemHomePage (untuk nyimpan data).
```
    final List<ItemHomepage> items = [
        ItemHomepage("Lihat Jersey", Icons.shopping_cart, Colors.blueGrey),
        ItemHomepage("Tambah Jersey", Icons.add, Colors.green),
        ItemHomepage("Logout", Icons.logout, Colors.red),
    ];
```

Kemudian, ketika di build saya convert menjadi class ItemCard (widget untuk button) dengan :
```
   Menampilkan ItemCard untuk setiap item dalam list items.
      children: items.map((ItemHomepage item) {
        return ItemCard(item);
      }).toList(),
```
##### 6). Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
Pada class ItemCard saya menambahkan ini, pada function Buildnya.
```
    color: item.color,
```
dan di pass dari ItemHomePage ketika di deklarasi diawal, dengan
```
    final List<ItemHomepage> items = [
        ItemHomepage("Lihat Jersey", Icons.shopping_cart, Colors.blueGrey),
        ItemHomepage("Tambah Jersey", Icons.add, Colors.green),
        ItemHomepage("Logout", Icons.logout, Colors.red),
    ];
```

##### 7). Memunculkan Snackbar dengan tulisan, "Kamu telah menekan tombol Lihat Daftar Produk" ketika tombol Lihat Daftar Produk ditekan., "Kamu telah menekan tombol Tambah Produk" ketika tombol Tambah Produk ditekan., "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
Di build function pada ItemCard saya menambahkan ini 
```
    InkWell(
      // Aksi ketika kartu ditekan.
      onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
               SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                );
          },
```
Saya menampilkan nya dengan SnackBar dengan content "Kamu Telah Menekan tombol .." agar bisa add semacam listener saya gunakan InkWell dan menggunakan properti onTap() agar ketika ditekan akan menampilkan snackbar dengan contentnya.
</details>