# E-Jersey-Mobile
---
<br>
Nama    : Muhammad Naufal Ramadhan <br>
NPM     : 2306241700 <br>
Kelas   : D <br>
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

<details>
<summary>
Tugas 8
</summary>
  
 ##### 1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
   `const` pada flutter itu sendiri adalah sebuah penyimpanan variabel yang immutable (tidak dapat diubah), keuntungannya adalah lebih hemat memori dibanding tipe variable lainnya seperti `var`. Waktu yang tepat untuk digunakan ketika kita ingin menyimpan nilai yang tidak akan berubah dan sudah ditentukan pada saat compile time, contohnya adalah daftar list-page pada drawer. dan sebaiknya tidak gunakan ketika kita ingin menyimpan nilai yang dinamis, baik itu yang dapat di set hanya pada saat run time atau berubah-ubah di run time.
   
 ##### 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
 seperti namanya, `Column` digunakan untuk mengatur dan menata widget secara vertikal, dimana `Row` secara horizontal. Disini juga terdapat perbedaan `MainAxis` dan `CrossAxis` nya, dimana `MainAxis` `Column` adalah Vertikal, dan `CrossAxis` nya Horizontal, dan `Row` kebalikannya. Contoh penggunaan `Column` yang paling jelas pada tugas ini terletak pada `jerseyentry_form.dart`, yaitu menata setiap label dan input field secara horizontal.
```
child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ...
        ]
)
```

dan contoh penggunaan row bisa dilihat pada `menu.dart` ketika menampilkan card NPM, Nama, dan Kelas.
```
Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      InfoCard(title: 'NPM', content: npm),
      InfoCard(title: 'Name', content: name),
      InfoCard(title: 'Class', content: className),
    ],
  ),
```

 
 ##### 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
 Pada form ini saya menggunakan satu saja, yaitu `TextFormField`, ada elemen input flutter lain yang tidak saya gunakan, contohnya `DropdownButtonFormField` (selecting choices), `Checkbox` (Ceklis Box). `DatePicker` (Field untuk tanggal). alasan kenapa saya hanya cukup menggunakan `TextFormField` karena field tersebut tidak terbatas hanya pada string saja, tetapi menerima int juga bisa, walaupun kita harus parse secara manual terlebih dahulu. Seperti berikut untuk validasinya
```
child: TextFormField(
  decoration: InputDecoration(
  hintText: "Harga Jersey",
  labelText: "Harga Jersey",
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onChanged: (String? value) {
    setState(() {
      _amount = int.tryParse(value!) ?? 0;
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Harga Jersey tidak boleh kosong!";
    }
    if (int.tryParse(value) == null) {
       return "Harga Jersey harus berupa angka!";
    }
    return null;
    },
  ),
```
 ##### 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
 Ya. Pertama saya me-set `ThemeData` pada `main.dart` dan menentukan colorscheme kesukaan saya. Agar theme nya konsisten dalam semua page flutter, saya menggunakan `Theme.of(context)`. Perlu diketahui `context` pada flutter disini mengacu kepada sebuah hierarki/pohon widget pada aplikasi tersebut, sehingga yang akan dilakukan adalah mengambil theme dari parent widget terdekat. Contoh pengaplikasian pada `left_drawer.dart` :
```
DrawerHeader(
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.primary,
  ),
...
```
 ##### 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
 Pada flutter, kita menggunakan `Navigator`. Sistemnya dengan menggunakan stack, semisal sebuah user menekan tombol, maka kita akan me push `Route` ke dalam stack navigator, yang akan menampilkan lamannya (karena terletak paling atas). Semisal user memencet laman lain ketika di dalam page tersebut, maka akan dilakukan hal yang sama dengan push `Route` ke stack. Kemudian, ketika user memencet tombol `Back`, Stack `Navigator` akan di pop (elemen teratas dibuang, dan elemen selanjutnya di show) ini merupakan langkah yang cocok untuk tipe navigasi pada mobile yang tidak menggunakan url seperti pada web. Sehingga ketika user sudah terletak pada elemen terakhir pada stack (pada homepage biasanya) maka user akan keluar dari app nya. 
</details>

<details>
<summary>
Tugas 9
</summary>
  
  ##### 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
  Model membantu dalam memetakan data JSON yang dikirim atau diterima dari backend menjadi objek yang lebih terstruktur di dalam aplikasi. Seharusnya tidak akan terjadi error jika kita tidak membuat model terlebih dahulu, tetapi bisa memperbesar chance untuk terjadinya error ketika parsing data json tersebut.
  
  ##### 2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
  Untuk melakukan http request, implementasi sudah yang digunakan disini adalah get dan post request. Contohnya ketika mengambil daftar jersey dari endpoint, dan post jersey baru yang dibuat di mobile.
  ##### 3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
  CookieRequest digunakan untuk melakukan request HTTP sambil mempertahankan sesi pengguna (session). dan tujan dibagikan ke seluruh komponen aplikasi adalah untuk menjaga konsistensi, karena semuanya menggunakan session cookies yang sama.
    ##### 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
  input dari user diambil dari widget tertentu, seperto textfield, dropdownfield, dan lain-lain. Kemudian data tersebut di validasi dan di proses (disimpan ke variable contohnya), kemudian variable tersebut di tampilkan pada dengan widget tertentu, contohnya Text().
  ##### 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
  1. Register, user mengisi form, kemudian akan di validasi (contoh email valid atau tidak), dan dikirim ke backend melalui http post, pada django email tersebut di validasi lagi, tetapi validasinya adalah apakah email tersebut sudah digunakan atau belom. dan kemudian akan mengirim status code kembali ke flutter.
  2. Login, user mengisi form, validasi apakah semua form terisi, lalu data dikirim ke backend dengan http post. pada django, cek apakah user tersebut sudah terdaftar atau belom, lalu dikirim status code nya balik, jika success maka akan mengembalikan session cookie, yang akan disimpan dengan CookieRequest pada flutter.
  3. Logout, flutter mengirim request ke endpoint logout dan juga session cookiesnya. pada django, di validasi apakah cookies nya ada atau tidak dan kemudian di hapus, dan mengirim response balik.
##### 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1) Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
Membuat form register pada flutter, dan juga membuat view register pada proyek django untuk menghandle registrasi dari flutter.
2) Membuat halaman login pada proyek tugas Flutter.
Membuat form login pada flutter, dan juga membuat view login pada proyek django untuk menghandle login dari flutter.
3 ) Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
Di-integrasikan dengan membuat views pada django khusus untuk menghandle authentikasi dari mobile.
4) Membuat model kustom sesuai dengan proyek aplikasi Django.
Pertama mengambil contoh json dari models saya pada endpoint json, dan saya gunakan web quicktype untuk membuatkan saya modelnya dari json tersebut.
5 ) Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
Membuat `list_jersey.dart` yang akan menampilkan item dari json pada user tersebut, dan tiap dari itemnya, saya tambahkan ontap untuk me push page route ke page untuk detail per item yang juga pass instance model yang di pencet.
6 ) Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
saya membuat `detail_jersey.dart` yang akan menampilkan detail per item, karena models nya juga di pass pada page list item, saya akan menampilan semua fieldnya dari instace model tersebut.
7) Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
Sudah, karena pada views.py untuk show_json, yang di return sudah di filter dengan filter(user=request.user)
</details>
