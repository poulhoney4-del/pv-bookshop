import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 58, 141, 183),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 58, 141, 183),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    const Center(child: Text('📚 ប្រភេទសៀវភៅ', style: TextStyle(fontSize: 22))),
    const Center(
      child: Text('👤 ព័ត៌មានផ្ទាល់ខ្លួន', style: TextStyle(fontSize: 22)),
    ),
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
        toolbarHeight: 72,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 48,
              height: 48,
              errorBuilder: (_, __, ___) => const FlutterLogo(size: 48),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'ហាងលក់សៀវភៅប្រចាំខេត្តព្រៃវែង',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ទំព័រដើម'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'ប្រភេទ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ខ្ញុំ'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  HomeContent({super.key});

  final List<Map<String, String>> _books = [
    {
      'image': 'assets/images/A.png',
      'title': 'ជំពប់ស្នេហ៍ប្រពន្ធជំនួស',
      'price': '32000៛',
    },
    {'image': 'assets/images/3.png', 'title': 'សៀវភៅចម្រៀង', 'price': '25000៛'},
    {'image': 'assets/images/4.png', 'title': 'កម្រងទស្សនៈ', 'price': '18000៛'},
    {
      'image': 'assets/images/2.png',
      'title': 'ព្រលឹតក្នុងថ្ងៃថ្មី',
      'price': '22000៛',
    },
    {'image': 'assets/images/5.png', 'title': 'រឿងនិទាន', 'price': '15000៛'},
    {'image': 'assets/images/6.png', 'title': 'រឿងនិទាន', 'price': '15000៛'},
    {
      'image': 'assets/images/7.png',
      'title': 'វិទ្យាសាស្ត្រ',
      'price': '27000៛',
    },
    {
      'image': 'assets/images/8.png',
      'title': 'ប្រវត្តិសាស្ត្រ',
      'price': '30000៛',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF5CB6C8),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(),
              const SizedBox(height: 16),
              _banner(),
              const SizedBox(height: 16),
              _sectionTitle('សៀវភៅពេញនិយម'),
              _bookList(),
              const SizedBox(height: 16),
              _sectionTitle('សៀវភៅថ្មី'),
              _bookListNew(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/images/.png'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'ស្វែងរកសៀវភៅ...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _banner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/3.png',
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/4.png',
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.red),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _bookList() {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16),
        itemCount: _books.length,
        itemBuilder: (context, index) => _bookItem(_books[index]),
      ),
    );
  }

  Widget _bookListNew() {
    final int showCount = 4;
    final int start = _books.length > showCount ? _books.length - showCount : 0;
    final List<Map<String, String>> newest = _books.sublist(start);

    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16),
        itemCount: newest.length,
        itemBuilder: (context, index) => _bookItem(newest[index]),
      ),
    );
  }

  Widget _bookItem(Map<String, String> book) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.asset(
                book['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) =>
                    const FlutterLogo(),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            book['title']!,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            book['price']!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.shopping_cart, size: 18),
        ],
      ),
    );
  }
}
