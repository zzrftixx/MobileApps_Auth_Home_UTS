import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Buat TextEditingController untuk mengontrol input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi untuk auto-fill (biar tidak ngetik untuk login,hanya untuk demo ya gais yaa)
  void _autoFillLogin() {
    _emailController.text =
        "user@example.com"; // Email default (ganti terserah anda wak)
    _passwordController.text = "password123"; // Password default
  }

  @override
  void dispose() {
    // Bersihkan controller ketika widget di dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 250),
              // Logo atau Ilustrasi
              // const Icon(
              //   Icons.lock_outlined,
              //   size: 100,
              //   color: Color(0xFF795548),
              // ),
              const SizedBox(height: 30),
              // Welcome Text
              const Text(
                'Silahkan Masuk!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF795548),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 50),
              // Form Fields
              TextField(
                controller: _emailController, // Tambahkan controller
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined,
                      color: Color(0xFF795548)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  // Tambahkan suffix icon untuk clear text
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _emailController.clear(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController, // Tambahkan controller
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon:
                      const Icon(Icons.lock_outline, color: Color(0xFF795548)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  // Tambahkan suffix icon untuk clear text
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _passwordController.clear(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Auto-fill Button
              TextButton(
                onPressed: _autoFillLogin,
                child: const Text(
                  'Auto Fill Login',
                  style: TextStyle(
                    color: Color(0xFF795548),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Login Button
              ElevatedButton(
                onPressed: () {
                  // Cek kredensial sebelum navigasi
                  if (_emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
                      (route) => false,
                    );
                  } else {
                    // Tampilkan pesan error jika form kosong
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all fields'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              // Register Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Color(0xFF795548),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
