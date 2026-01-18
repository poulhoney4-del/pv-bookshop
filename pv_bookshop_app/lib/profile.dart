import 'package:flutter/material.dart';
import 'type.dart';
import 'main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1EC0F2),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Avatar
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            ),

            const SizedBox(height: 10),

            /// Line
            Container(width: 120, height: 2, color: Colors.white),

            const SizedBox(height: 16),

            /// Title
            const Text(
              'ចូលប្រើប្រាស់',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 20),

            /// Phone input
            _inputBox(icon: Icons.phone, hint: '+855  បញ្ចូលលេខទូរស័ព្ទ'),

            const SizedBox(height: 12),

            /// Password input
            _inputBox(icon: Icons.lock, hint: 'ពាក្យសម្ងាត់', isPassword: true),

            const SizedBox(height: 20),

            /// Facebook button
            _socialButton(
              color: Colors.blue,
              icon: Icons.facebook,
              text: 'Continue with Facebook',
            ),

            const SizedBox(height: 12),

            /// Google button
            _socialButton(
              color: Colors.black87,
              icon: Icons.g_mobiledata,
              text: 'Continue with Google',
            ),
          ],
        ),
      ),

      /// Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            // Home - navigate to HomePage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          } else if (index == 1) {
            // Books - navigate to BookListPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const BookListPage()),
            );
          } else if (index == 2) {
            // Profile - already on profile page
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ទំព័រដើម'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'ប្រភេទ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ខ្ញុំ'),
        ],
      ),
    );
  }

  /// 🔹 Input box widget
  Widget _inputBox({
    required IconData icon,
    required String hint,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            icon: Icon(icon),
            hintText: hint,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  /// 🔹 Social button widget
  Widget _socialButton({
    required Color color,
    required IconData icon,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          // Show loading dialog
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Row(
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(width: 16),
                    Text('$text...'),
                  ],
                ),
              );
            },
          );

          // Simulate authentication delay and navigate
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pop(context); // Close loading dialog
            Navigator.pop(context); // Go back to home
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Welcome! Logged in with $text')),
            );
          });
        },
        icon: Icon(icon, color: Colors.white),
        label: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
