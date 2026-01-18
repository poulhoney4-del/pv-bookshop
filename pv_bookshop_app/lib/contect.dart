import 'package:flutter/material.dart';
import 'main.dart';
import 'Type.dart';
import 'profile.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8E7CC3), // purple background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Contact Us"),
        centerTitle: true,
      ),
      bottomNavigationBar: _buildBottomNav(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildContactCard(),
              const SizedBox(height: 24),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: const [
        Text(
          "ទំនាក់ទំនង",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "សូមទាក់ទងមកកាន់យើងខ្ញុំតាមរយៈព័ត៌មានខាងក្រោម",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildContactCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF1EA7E1), // blue card
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "ទំនាក់ទំនង",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _infoRow(Icons.phone, "+855 886800515"),
            _infoRow(Icons.email, "pouhoney@gmail.com"),
            _infoRow(
              Icons.location_on,
              "132 Dartmouth Street\nBoston, MA 02156\nUnited States",
            ),
            const SizedBox(height: 16),
            _buildSocialIcons(),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.facebook, color: Colors.white),
        SizedBox(width: 16),
        Icon(Icons.camera_alt, color: Colors.white),
        SizedBox(width: 16),
        Icon(Icons.chat, color: Colors.white),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1A237E),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: const Text("បញ្ជូន", style: TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
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
          // Profile - navigate to ProfilePage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const ProfilePage()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ទំព័រដើម'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'ប្រភេទ'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ខ្ញុំ'),
      ],
    );
  }
}
