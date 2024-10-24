import 'package:flutter/material.dart';
import 'about_page.dart'; // Import halaman About
import 'profile_page.dart'; // Halaman Profile
import 'package:google_fonts/google_fonts.dart'; // Menggunakan Google Fonts

/// Halaman Home yang menampilkan produk dan navigasi ke halaman lain.
class HomePage extends StatefulWidget {
  final String username;

  HomePage({required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  /// Daftar halaman yang ditampilkan di Bottom Navigation
  final List<Widget> _pages = [
    ShopPage(), // Halaman Utama
    ProfilePage(username: 'User'), // Halaman Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dimas App',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 64, 120, 251),
        elevation: 0,
        centerTitle: true,

        // Tambahkan ikon di AppBar untuk halaman About
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 64, 170, 251),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

/// Halaman Utama (Shop)
class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Gambar Produk
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/background_home.jpg', // Ubah path gambar sesuai kebutuhan
              width: screenWidth * 0.9,
              height: screenWidth * 0.6,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),

          // Deskripsi Produk
          Text(
            'FKMPI atau Forum Komunikasi Mahasiswa Politeknik Se-Indonesia adalah organisasi berbentuk forum yang menjadi wadah informasi, komunikasi, aspirasi, dan pengembangan bakat-minat mahasiswa politeknik seluruh Indonesa. Forum ini mempunyai pergerakan secara horizontal (sosial-masyarakat) dan vertikal yang mengawasi kebijakan pemerintah',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 9, 14, 137),
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
