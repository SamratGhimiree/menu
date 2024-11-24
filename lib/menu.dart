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
                ),
                MenuItem(
                  name: 'Pizza',
                  image: 'assets/images/pizza.jpg',
                ),
                MenuItem(
                  name: 'Fries',
                  image: 'assets/images/fries.jpg',
                ),
              ],
            ),
            FoodList(
              category: 'Breakfast',
              items: [
                MenuItem(
                  name: 'Pancakes',
                  image: 'assets/images/pancakes.jpg',
                ),
                MenuItem(
                  name: 'Omelette',
                  image: 'assets/images/omelette.jpg',
                ),
                MenuItem(
                  name: 'Toast',
                  image: 'assets/images/toast.jpg',
                ),
              ],
            ),
            FoodList(
              category: 'Hard Drinks',
              items: [
                MenuItem(
                  name: 'Whiskey',
                  image: 'assets/images/whiskey.jpg',
                ),
                MenuItem(
                  name: 'Vodka',
                  image: 'assets/images/vodka.jpg',
                ),
                MenuItem(
                  name: 'Wine',
                  image: 'assets/images/wine.jpg',
                ),
              ],
            ),
            FoodList(
              category: 'Soft Drinks',
              items: [
                MenuItem(
                  name: 'Coke',
                  image: 'assets/images/coke.jpg',
                ),
                MenuItem(
                  name: 'Pepsi',
                  image: 'assets/images/pepsi.jpg',
                ),
                MenuItem(
                  name: 'Lemonade',
                  image: 'assets/images/lemonade.jpg',
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

  MenuItem({required this.name, required this.image});
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
              width: 20,
              height: 20,
              fit: BoxFit.cover,
            ),
            title: Text(item.name),
            trailing: ElevatedButton(
              onPressed: () {
                // Simulate order placement
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
