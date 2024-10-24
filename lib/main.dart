// import 'package:flutter/material.dart';

// void main() => runApp(const MainApp());

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     // Mendeklarasikan warna utama dari tema
//     Color color = Theme.of(context).primaryColor;
//     // Widget titleSection yang berisi struktur Row dan Column untuk title
//     Widget titleSection = Container(
//       padding: const EdgeInsets.all(32),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: const Text(
//                     'Wisata Gunung di Batu',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const Text(
//                   'Batu, Malang, Indonesia',
//                   style: TextStyle(
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Icon(
//             Icons.star,
//             color: Colors.red,
//           ),
//           const Text('41'),
//         ],
//       ),
//     );
//     // Widget buttonSection yang berisi kolom-kolom dengan ikon dan teks
//     Widget buttonSection = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildButtonColumn(color, Icons.call, 'CALL'),
//         _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//         _buildButtonColumn(color, Icons.share, 'SHARE'),
//       ],
//     );
//     // Widget textSection yang berisi teks dengan padding
//     Widget textSection = Container(
//       padding: const EdgeInsets.all(32),
//       child: const Text(
//         'Carilah teks di internet yang sesuai '
//         'dengan foto atau tempat wisata yang ingin '
//         'Anda tampilkan. '
//         'Tambahkan nama dan NIM Anda sebagai '
//         'identitas hasil pekerjaan Anda. '
//         'Selamat mengerjakan 🙂.',
//         softWrap: true, // Membungkus teks jika melebihi lebar kolom
//       ),
//     );
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Layout Demo',
//       home: Scaffold(
//         body: ListView(
//           children: [
//             Image.asset(
//               '/bromo.jpeg',
//             ),
//             titleSection, // Section untuk judul
//             buttonSection, // Section untuk tombol
//             textSection, // Section untuk teks
//           ],
//         ),
//       ),
//     );
//   }

//   // Method untuk membangun kolom tombol dengan ikon dan teks
//   Column _buildButtonColumn(Color color, IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color), // Ikon dengan warna yang ditentukan
//         Container(
//           margin: const EdgeInsets.only(top: 8), // Jarak atas teks
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 12, // Ukuran font untuk teks
//               fontWeight: FontWeight.w400,
//               color: color, // Warna teks sesuai parameter
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'pages/landing_page.dart'; // Impor Halaman Landing sebagai halaman awal

// Fungsi utama aplikasi Flutter yang akan dieksekusi pertama kali.
void main() {
  runApp(MyApp()); // Menjalankan aplikasi dengan widget MyApp sebagai root.
}

// Widget utama aplikasi, menggunakan StatelessWidget karena tidak ada state dinamis.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug di pojok kanan atas.
      title: 'Aplikasi Sederhana', // Judul aplikasi yang ditampilkan pada task manager.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Warna tema utama aplikasi.
      ),
      home: LandingPage(), // Halaman awal yang ditampilkan adalah LandingPage.
    );
  }
}
