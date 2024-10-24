import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Tambahkan Google Fonts
import 'login_page.dart'; // Halaman Login

/// LandingPage adalah halaman pertama aplikasi, menampilkan gambar latar,
/// teks selamat datang, dan tombol untuk masuk ke halaman LoginPage.
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar agar layout responsif.
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Gambar Background Fullscreen
          Positioned.fill(
            child: Image.asset(
              'assets/background_landing.jpg',
              fit: BoxFit.cover, // Gambar menyesuaikan layar tanpa distorsi
            ),
          ),
          // Overlay Gradient untuk Kontras
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
          // Konten Utama di Tengah Layar
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Teks "Selamat Datang di Aplikasi Kami"
                Text(
                  'Selamat Datang di Dimas App',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5, // Spasi antar huruf
                      shadows: [
                        Shadow(
                          blurRadius: 8.0,
                          color: Colors.black45,
                          offset: Offset(2, 2), // Efek bayangan pada teks
                        ),
                      ],
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),

                // Tombol "Masuk Sekarang" untuk pindah ke LoginPage
                SizedBox(
                  width: screenWidth * 0.8, // Lebar tombol responsif
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 10, 27, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Tombol bulat
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      elevation: 8.0, // Efek bayangan pada tombol
                    ),
                    onPressed: () {
                      // Navigasi ke halaman LoginPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Masuk Sekarang',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
