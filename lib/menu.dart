import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hotel Menu'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Fast Food'),
              Tab(text: 'Breakfast'),
              Tab(text: 'Hard Drinks'),
              Tab(text: 'Soft Drinks'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FoodList(
              category: 'Fast Food',
              items: [
                MenuItem(
                  name: 'Burger',
                  image: 'assets/images/burger.jpg',
                  price: 200.0,
                ),
                MenuItem(
                  name: 'Pizza',
                  image: 'assets/images/pizza.jpg',
                  price: 300.0,
                ),
                MenuItem(
                  name: 'Fries',
                  image: 'assets/images/fries.jpg',
                  price: 100.0,
                ),
              ],
            ),
            FoodList(
              category: 'Breakfast',
              items: [
                MenuItem(
                  name: 'Pancakes',
                  image: 'assets/images/pancakes.jpg',
                  price: 250.0,
                ),
                MenuItem(
                  name: 'Omelette',
                  image: 'assets/images/omelette.jpg',
                  price: 150.0,
                ),
                MenuItem(
                  name: 'Toast',
                  image: 'assets/images/toast.jpg',
                  price: 100.0,
                ),
              ],
            ),
            FoodList(
              category: 'Hard Drinks',
              items: [
                MenuItem(
                  name: 'Whiskey',
                  image: 'assets/images/whiskey.jpg',
                  price: 500.0,
                ),
                MenuItem(
                  name: 'Vodka',
                  image: 'assets/images/vodka.jpg',
                  price: 450.0,
                ),
                MenuItem(
                  name: 'Wine',
                  image: 'assets/images/wine.jpg',
                  price: 600.0,
                ),
              ],
            ),
            FoodList(
              category: 'Soft Drinks',
              items: [
                MenuItem(
                  name: 'Coke',
                  image: 'assets/images/coke.jpg',
                  price: 50.0,
                ),
                MenuItem(
                  name: 'Pepsi',
                  image: 'assets/images/pepsi.jpg',
                  price: 50.0,
                ),
                MenuItem(
                  name: 'Lemonade',
                  image: 'assets/images/lemonade.jpg',
                  price: 60.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String name;
  final String image;
  final double price; // Updated to double

  MenuItem({required this.name, required this.image, required this.price});
}

class FoodList extends StatelessWidget {
  final String category;
  final List<MenuItem> items;

  FoodList({required this.category, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            leading: Image.asset(
              item.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(item.name),
            subtitle: Text('Price: Rs. ${item.price.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.name} added to order')),
                );
              },
              child: Text('Order'),
            ),
          ),
        );
      },
    );
  }
}
