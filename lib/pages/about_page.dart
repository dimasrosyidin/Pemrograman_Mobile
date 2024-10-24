import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Tentang Aplikasi',
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
              // Icon atau Header Deskripsi
              Icon(
                Icons.info_outline,
                size: screenWidth * 0.2,
                color: Colors.deepPurple,
              ),
              SizedBox(height: 24.0),

              // Deskripsi Singkat Tentang Aplikasi
              Text(
                'Aplikasi Sederhana Menggunakan Flutter',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),

              Text(
                'Aplikasi ini memiliki fitur login dan navigasi antar halaman. '
                'Dirancang untuk memberikan pengalaman pengguna yang mudah dan cepat.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.0),

              // Tombol Kembali ke Halaman Sebelumnya
              SizedBox(
                width: screenWidth * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    elevation: 8.0, // Efek bayangan
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Navigasi kembali
                  },
                  child: Text(
                    'Kembali',
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