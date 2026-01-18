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
      title: 'Book Store',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.pink[100], // ✅ background pink
      ),
      home: const BookListPage(),
    );
  }
}

/* ------------------ MODEL ------------------ */
class CartItem {
  final String title;
  final String image;
  final double price;
  int quantity;

  CartItem({
    required this.title,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}

/* ------------------ BOOK LIST PAGE ------------------ */
class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<CartItem> cart = [];

  final List<Map<String, dynamic>> books = [
    {
      'image': 'assets/images/8.png',
      'title': 'រណ្ដៅស្នេហ៍កម្ម',
      'price': 33000.0,
    },
    {
      'image': 'assets/images/2.png',
      'title': 'អំណាច​នៃបច្ចុប្បន្ន',
      'price': 28000.0,
    },
    {
      'image': 'assets/images/3.png',
      'title': 'ស្នេហ៍កតែមួយគត់',
      'price': 32000.0,
    },
  ];

  void addToCart(Map<String, dynamic> book) {
    final index = cart.indexWhere((item) => item.title == book['title']);

    setState(() {
      if (index >= 0) {
        cart[index].quantity++;
      } else {
        cart.add(
          CartItem(
            title: book['title'],
            image: book['image'],
            price: book['price'],
          ),
        );
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('បានបន្ថែម ${book['title']}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartPage(cart: cart)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            margin: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 3, 188, 249), // ✅ light pink card
            child: ListTile(
              leading: GestureDetector(
                onTap: () => addToCart(book),
                child: Image.asset(book['image'], width: 60, fit: BoxFit.cover),
              ),
              title: Text(book['title']),
              subtitle: Text('${book['price'].toInt()} ៛'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BookDetailPage(book: book)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

/* ------------------ CART PAGE ------------------ */
class CartPage extends StatefulWidget {
  final List<CartItem> cart;
  const CartPage({super.key, required this.cart});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get totalPrice {
    return widget.cart.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      backgroundColor: const Color.fromARGB(
        255,
        3,
        232,
        248,
      ), // ✅ pink background
      body: Column(
        children: [
          Expanded(
            child: widget.cart.isEmpty
                ? const Center(child: Text('Cart is empty'))
                : ListView.builder(
                    itemCount: widget.cart.length,
                    itemBuilder: (context, index) {
                      final item = widget.cart[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        color: const Color.fromARGB(255, 4, 202, 252),
                        child: ListTile(
                          leading: Image.asset(item.image, width: 50),
                          title: Text(item.title),
                          subtitle: Text(
                            '${item.price.toInt()} x ${item.quantity}',
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if (item.quantity > 1) {
                                      item.quantity--;
                                    }
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    item.quantity++;
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    widget.cart.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'TOTAL: ${totalPrice.toInt()} ៛',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: widget.cart.isEmpty
                      ? null
                      : () {
                          widget.cart.clear();
                          setState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Checkout Success')),
                          );
                        },
                  child: const Text('CHECKOUT'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* ------------------ BOOK DETAIL PAGE ------------------ */
class BookDetailPage extends StatelessWidget {
  final Map<String, dynamic> book;
  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book['title'])),
      backgroundColor: Colors.pink[100], // ✅ pink background
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(book['image'], height: 220)),
            const SizedBox(height: 20),
            Text(
              book['title'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '${book['price'].toInt()} ៛',
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'ប្រភេទសៀវភៅ៖ ប្រលោមលោក',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'ទំព័រសរុប៖ ១២៨ ទំព័រ',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'អ្នកនិពន្ធ៖ ឈ្មោះអ្នកនិពន្ធ',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'ឆ្នាំបោះពុម្ព៖ ២០២4',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
