import 'package:flutter/material.dart';
import 'cart.dart';
import 'main.dart';

class MenuScreen extends StatelessWidget {
  final Cart cart; // Receive the shared cart instance

  MenuScreen({required this.cart});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          title: Text('Menu'),
          backgroundColor: Colors.blueGrey,
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
              cart: cart,
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
              cart: cart,
            ),
            FoodList(
              category: 'Hard Drinks',
              items: [
                MenuItem(
                  name: 'Whiskey',
                  image: 'assets/images/Whiskey.jpg',
                  price: 500.0,
                ),
                MenuItem(
                  name: 'Vodka',
                  image: 'assets/images/Vodka.jpg',
                  price: 450.0,
                ),
                MenuItem(
                  name: 'Wine',
                  image: 'assets/images/Wine.jpg',
                  price: 600.0,
                ),
              ],
              cart: cart,
            ),
            FoodList(
              category: 'Soft Drinks',
              items: [
                MenuItem(
                  name: 'Coke',
                  image: 'assets/images/coke.png',
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
              cart: cart,
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
  final Cart cart; // Receive the shared cart instance


  FoodList({required this.category, required this.items, required this.cart});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: Colors.blueGrey,
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
                cart.addItem(item);  // Add the selected item to the cart
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.name} added to cart')),
                );
              },
              child: Text('Add to Cart'),
            ),

          ),
        );
      },
    );
  }
}
