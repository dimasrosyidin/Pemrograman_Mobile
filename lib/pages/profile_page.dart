import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  /// Konstruktor menerima username dari halaman Login.
  ProfilePage({required this.username});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Profile Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Avatar menggunakan gambar profile.jpg dari assets
              Container(
                width: screenWidth * 0.4,
                height: screenWidth * 0.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    width: 4.0, // Ketebalan border
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/profile.jpg', // Path gambar profil
                    fit: BoxFit.cover,
                    width: screenWidth * 0.4,
                    height: screenWidth * 0.4,
                  ),
                ),
              ),
              SizedBox(height: 24.0),

              // Nama User dari Input Login
              Text(
                'Username: $username',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.0),

              // Info Tambahan untuk User
              Text(
                'Selamat datang di aplikasi kami!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.0),

              // Tombol Kembali ke HomePage
              SizedBox(
                width: screenWidth * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    elevation: 8.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Kembali ke HomePage
                  },
                  child: Text(
                    'Kembali ke Home',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
