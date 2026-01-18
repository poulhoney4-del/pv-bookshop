import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';
import 'Type.dart';
import 'profile.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19BEEA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),

              /// 🔹 Title
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.red),
                ),
                child: const Center(
                  child: Text(
                    'អំពីយើង',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// 🔹 About text box
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'សូមស្វាគមន៍មកកាន់ហាងលក់សៀវភៅរបស់យើង។ '
                  'យើងផ្តល់ជូនសៀវភៅជាច្រើនប្រភេទ ដូចជា រឿងនិទាន ប្រលោមលោក '
                  'វិទ្យាសាស្ត្រ ប្រវត្តិសាស្ត្រ និងសៀវភៅអប់រំផ្សេងៗទៀត។\n\n'
                  'គោលបំណងរបស់យើងគឺផ្តល់នូវសៀវភៅដែលមានគុណភាព '
                  'និងសេវាកម្មល្អបំផុតដល់អតិថិជន។ '
                  'យើងសង្ឃឹមថាអ្នកនឹងទទួលបានបទពិសោធន៍ល្អ '
                  'នៅពេលទិញសៀវភៅជាមួយយើង។',
                  textAlign: TextAlign.justify,
                  style: TextStyle(height: 1.6),
                ),
              ),

              const SizedBox(height: 20),

              /// 🔹 Contact box
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFD9FAFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ទំនាក់ទំនងមកយើង',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text('📞 093 701 571'),

                    const Divider(height: 24),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('សេវាកម្ម'),
                              SizedBox(height: 6),
                              Text('• លក់សៀវភៅ'),
                              Text('• ដឹកជញ្ជូន'),
                              Text('• បញ្ជាទិញ'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ព័ត៌មាន'),
                              SizedBox(height: 6),
                              Text('• អំពីយើង'),
                              Text('• ទំនាក់ទំនង'),
                              Text('• គោលការណ៍'),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// 🔹 Social icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _launchURL(
                            'https://www.facebook.com/share/1CE4c5fasM/',
                          ),
                          child: const Icon(
                            Icons.facebook,
                            color: Colors.red,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () => _launchURL('mailto:pouhoney@gmail.com'),
                          child: const Icon(
                            Icons.email,
                            color: Colors.red,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () => _launchURL('https://www.instagram.com'),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.red,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () => _launchURL('https://www.youtube.com'),
                          child: const Icon(
                            Icons.play_circle,
                            color: Colors.red,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),

      /// 🔹 Bottom navigation
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
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not launch $url')));
    }
  }
}
