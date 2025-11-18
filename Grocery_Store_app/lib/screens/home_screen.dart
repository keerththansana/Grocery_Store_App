import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/grocery_item.dart';
import '../widgets/grocery_item_card.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<GroceryItem> _items = [];

  /// Fetch grocery items from the JSON file
  Future<void> _fetchItems() async {
    try {
      final data = await DefaultAssetBundle.of(context).loadString('assets/data/grocery_items.json');
      final List<dynamic> jsonResult = json.decode(data);
      setState(() {
        _items = jsonResult.map((item) => GroceryItem.fromJson(item)).toList();
      });
    } catch (e) {
      print('Error loading JSON data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchItems(); // Load grocery items at startup
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Freshly Grocery Store',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 253, 177, 2),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Welcome message and search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Freshly!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 253, 132, 2),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for items...',
                    prefixIcon: Icon(Icons.search, color: const Color.fromARGB(255, 249, 150, 2)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 230, 219, 200),
                  ),
                ),
              ],
            ),
          ),
          // Display items in a grid
          Expanded(
            child: _items.isEmpty 
                ? const Center(
                    child: CircularProgressIndicator(), 
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, 
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: _items.length,
                    itemBuilder: (ctx, index) => GroceryItemCard(item: _items[index]),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => CartScreen()),
          );
        },
        label: Text(
          'Cart',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.shopping_cart, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 242, 137, 0),
      ),
    );
  }
}
