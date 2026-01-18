import 'package:flutter/material.dart';
import 'type.dart';
import 'profile.dart';
import 'main.dart';

class AllBookPage extends StatefulWidget {
  const AllBookPage({super.key});

  @override
  State<AllBookPage> createState() => _AllBookPageState();
}

class _AllBookPageState extends State<AllBookPage> {
  int _currentIndex = 0;

  final List<Map<String, String>> books = const [
    {
      'image': 'assets/images/A.png',
      'title': 'ជំពប់ស្នេហ៍ប្រពន្ធជំនួស',
      'price': '30000.00៛',
    },
    {
      'image': 'assets/images/2.png',
      'title': 'ផ្ដើមពីមួយជំហាន​',
      'price': '32000.00៛',
    },
    {
      'image': 'assets/images/3.png',
      'title': 'ស្នេហ៍កតែមួយគត់',
      'price': '33000.00៛',
    },
    {
      'image': 'assets/images/4.png',
      'title': 'ពន្លឺផ្កាយនៅពេលថ្ងៃ',
      'price': '30000.00៛',
    },
    {
      'image': 'assets/images/5.png',
      'title': 'ម៉ែគ្រូជិះក្របី',
      'price': '28000.00៛',
    },
    {
      'image': 'assets/images/6.png',
      'title': 'ផ្កាសត្វចម្លែក',
      'price': '32000.00៛',
    },
    {
      'image': 'assets/images/7.png',
      'title': 'ស្នេហ៍អស់ពីហឬទ័យ',
      'price': '28000.00៛',
    },
    {
      'image': 'assets/images/8.png',
      'title': 'រណ្ដៅស្នេហ៍កម្ម',
      'price': '28000.00៛',
    },
    {
      'image': 'assets/images/9.png',
      'title': 'ពេលព្រឹកដ៏អស្ចារ្យ',
      'price': '33000.00៛',
    },
    {
      'image': 'assets/images/10.png',
      'title': 'កំណត់ហេតុពណ៍ស្វាយ',
      'price': '32000៛',
    },
    {
      'image': 'assets/images/11.png',
      'title': 'អំណាចនៃបច្ចុប្បន្ន',
      'price': '32000៛',
    },
    {
      'image': 'assets/images/12.png',
      'title': 'គំនិតបង្កេីតភាពស្ដុកស្ដម្ភ',
      'price': '32000៛',
    },
    {'image': 'assets/images/13.png', 'title': 'នាយរោង', 'price': '28000៛'},
    {
      'image': 'assets/images/14.png',
      'title': 'ត្រាស្នេហ៍ព្រៃផ្សៃ',
      'price': '32000៛',
    },
    {
      'image': 'assets/images/15.png',
      'title': 'តម្រាស្នេហ៍ឆ្លងភព',
      'price': '28000៛',
    },
    {
      'image': 'assets/images/16.png',
      'title': 'កំណត់ហេតុស្នេហ៍វេជ្ជបណ្ឌិត',
      'price': '32000៛',
    },
    {
      'image': 'assets/images/17.png',
      'title': 'សម្ដេចជួនណាត',
      'price': '28000៛',
    },
    {'image': 'assets/images/18.png', 'title': 'ការចងចាំ', 'price': '28000៛'},
    {'image': 'assets/images/19.png', 'title': 'រនាំងវណ្ណ:', 'price': '32000៛'},
    {
      'image': 'assets/images/20.png',
      'title': 'ថាមពលនៃការបង្កើតទម្លាប់តូចៗ',
      'price': '32000៛',
    },
    {'image': 'assets/images/21.png', 'title': 'ពិចារណា', 'price': '32000៛'},
    {
      'image': 'assets/images/22.png',
      'title': 'តម្រាឈ្នះចិត្តមនុស្ស',
      'price': '32000៛',
    },
    {
      'image': 'assets/images/23.png',
      'title': 'កម្លាំងនៃការគិតវិជ្ជមាន',
      'price': '32000៛',
    },
    {'image': 'assets/images/24.png', 'title': 'ឱកាស', 'price': '28000៛'},
    {
      'image': 'assets/images/25.png',
      'title': 'កម្រៃការគិត',
      'price': '28000៛',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1EC0F2),
      body: SafeArea(
        child: Column(
          children: [
            /// Search / Title
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'សៀវភៅទាំងអស់',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            /// Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/banner.png',
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'ទិញចាប់ពី 2 ក្បាល Free delivery',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// Book grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: books.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final book = books[index];
                  return _bookItem(book);
                },
              ),
            ),
          ],
        ),
      ),

      /// Bottom navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            // Home - navigate back to HomePage
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
            Navigator.push(
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

  /// 📚 Book item widget
  Widget _bookItem(Map<String, String> book) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              book['image']!,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          book['title']!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 1),
        Text(
          book['price']!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
        ),
      ],
    );
  }
}
