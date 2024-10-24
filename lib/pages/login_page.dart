import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:google_fonts/google_fonts.dart'; // Tambahkan Google Fonts

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'dimas' && password == '123456') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(username: username),
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'Username atau password salah';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image Fullscreen
          Positioned.fill(
            child: Image.asset(
              'assets/background_login.jpg',
              fit: BoxFit.cover,
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
          // Form Login
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Judul Login
                  Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black45,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  // TextField Username
                  Container(
                    decoration: BoxDecoration(
                      color: Colors
                          .blue[100], // Warna background biru untuk kontainer
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: Colors.blue, width: 2.0), // Border biru
                    ),
                    child: TextField(
                      controller: _usernameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor:
                            Colors.blueAccent, // Ubah warna kolom menjadi biru
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.person, color: Colors.white70),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // TextField Password
                  Container(
                    decoration: BoxDecoration(
                      color: Colors
                          .blue[100], // Warna background biru untuk kontainer
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: Colors.blue, width: 2.0), // Border biru
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor:
                            Colors.blueAccent, // Ubah warna kolom menjadi biru
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.white70),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Tombol Login
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 10, 27, 207),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        elevation: 8.0,
                      ),
                      onPressed: _login,
                      child: Text(
                        'Login',
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
                  SizedBox(height: 16),
                  // Pesan Error jika Login Gagal
                  if (_errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
