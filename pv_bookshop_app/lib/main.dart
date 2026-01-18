import 'package:flutter/material.dart';
import 'type.dart';
import 'profile.dart';
import 'allbook.dart';
import 'aboutus.dart';
import 'contect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late TextEditingController _searchController;
  List<Map<String, String>> _filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredBooks = [...popularBooks, ...newBooks];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchBooks(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredBooks = [...popularBooks, ...newBooks];
      } else {
        _filteredBooks = [...popularBooks, ...newBooks].where((book) {
          final title = book['title']?.toLowerCase() ?? '';
          final searchQuery = query.toLowerCase();
          return title.contains(searchQuery);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5CB6C8),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 66, 167, 217),

        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.white,
              child: const Icon(
                Icons.book,
                color: Color.fromARGB(194, 205, 52, 52),
              ),
            ),
          ),
        ),
        title: const Text(
          'ហាងលក់សៀវភៅ​ប្រចាំខេត្តព្រៃវែង',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _menu(context),
            const SizedBox(height: 12),
            _searchBar(),
            const SizedBox(height: 16),
            _banner(),
            const SizedBox(height: 16),
            if (_searchController.text.isEmpty)
              Column(
                children: [
                  _title('សៀវភៅពេញនិយម'),
                  _bookList(popularBooks),
                  _title('សៀវភៅថ្មី'),
                  _bookList(newBooks),
                ],
              )
            else if (_filteredBooks.isEmpty)
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'មិនរកឃើញលទ្ធផល',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            else
              Column(
                children: [_title('លទ្ធផលស្វាគមន៍'), _bookList(_filteredBooks)],
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            // Home - already on home page
          } else if (index == 1) {
            // Books - navigate to BookListPage
            Navigator.push(
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
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'សៀវភៅ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ខ្ញុំ'),
        ],
      ),
    );
  }

  /// 🔹 Menu
  Widget _menu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _menuItem('ទំព័រដើម', () {}),
          _menuItem('ប្រភេទ', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const BookListPage()),
            );
          }),
          _menuItem('សៀវភៅទាំងអស់', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AllBookPage()),
            );
          }),
          _menuItem('អំពីយើង', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AboutUsPage()),
            );
          }),
          _menuItem('ទំនាក់ទំនង', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ContactPage()),
            );
          }),
        ],
      ),
    );
  }

  Widget _menuItem(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// 🔹 Search Bar
  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _searchController,
        onChanged: _searchBooks,
        decoration: InputDecoration(
          hintText: 'ស្វាគមន៍រកលេង',
          prefixIcon: const Icon(
            Icons.search,
            color: Color.fromARGB(255, 218, 226, 208),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 189, 210, 32),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  /// 🔹 Banner
  Widget _banner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _bannerImage('assets/images/27.png'),
          const SizedBox(width: 10),
          _bannerImage('assets/images/28.png'),
        ],
      ),
    );
  }

  Widget _bannerImage(String img) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(img, height: 140, fit: BoxFit.cover),
      ),
    );
  }

  /// 🔹 Section title
  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: const TextStyle(
          color: Color.fromARGB(255, 245, 12, 12),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// 🔹 Book list
  Widget _bookList(List<Map<String, String>> books) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (_, i) => _bookItem(books[i]),
      ),
    );
  }

  Widget _bookItem(Map<String, String> book) {
    return Container(
      width: 140,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(book['image']!, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                Text(
                  book['title']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  book['price']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔹 Data
final popularBooks = [
  {
    'image': 'assets/images/A.png',
    'title': 'ជំពប់ស្នេហ៍ប្រពន្ធជំនួស',
    'price': '32000៛',
  },
  {
    'image': 'assets/images/3.png',
    'title': 'ស្នេហ៍តែមួយគត់',
    'price': '32000៛',
  },
  {
    'image': 'assets/images/4.png',
    'title': 'ពន្លឺផ្កាយនៅពេលថ្ងៃ',
    'price': '32000៛',
  },
  {
    'image': 'assets/images/14.png',
    'title': 'ត្រាស្នេហ៍ព្រៃផ្សៃ',
    'price': '28000៛',
  },
  {
    'image': 'assets/images/15.png',
    'title': 'តម្រាស្នេហ៍កឆ្លងភព',
    'price': '28000៛',
  },
  {
    'image': 'assets/images/16.png',
    'title': 'កំណត់ហេតុស្នេហ៍វេជ្ជបណ្ឌិត',
    'price': '32000៛',
  },
  {
    'image': 'assets/images/17.png',
    'title': 'សម្ដេច​​​​ជួន​ណាត',
    'price': '28000៛',
  },
  {'image': 'assets/images/18.png', 'title': 'ការចងចាំ', 'price': '28000៛'},
  {'image': 'assets/images/19.png', 'title': 'រនាំងវណ្ណ:', 'price': '28000៛'},
];

final newBooks = [
  {
    'image': 'assets/images/5.png',
    'title': 'ម៉ែគ្រូជិះក្របី',
    'price': '32000៛',
  },
  {
    'image': 'assets/images/6.png',
    'title': 'ផ្កាសត្វចម្លែក',
    'price': '28000៛',
  },
  {
    'image': 'assets/images/7.png',
    'title': 'ស្នេហ៍អស់ពីហឬទ័យ',
    'price': '32000៛',
  },
  {
    'image': 'assets/images/8.png',
    'title': 'រណ្ដៅស្នេហ៍កម្ម',
    'price': '32000៛',
  },
  {
    'image': 'assets/images/9.png',
    'title': 'ពេលព្រឹកដ៏អស្ចារ្យ',
    'price': '32000៛',
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
];
