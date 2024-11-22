import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final List<Map<String, String>> menuItems = [
    {
      'name': 'Burger',
      'description': 'burger khani nai ho tw.',
      'price': '99',
      'image': 'assets/burger.jpg', // Replace with actual asset paths
    },
    {
      'name': 'Pizza',
      'description': 'Cheese pizza with a crispy crust.',
      'price': '899',
      'image': 'assets/pizza.jpg', // Replace with actual asset paths
    },
    {
      'name': 'Pasta',
      'description': 'Pasta with marinara sauce and fresh herbs.',
      'price': '250',
      'image': 'assets/pasta.jpg', // Replace with actual asset paths
    },
    // Add more menu items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Menu'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(menuItems[index]['image']!),
              title: Text(menuItems[index]['name']!),
              subtitle: Text(menuItems[index]['description']!),
              trailing: Text('\ Rs ${menuItems[index]['price']}'),
              onTap: () {
                // Logic for adding item to cart or navigating to item details
                print('Item tapped: ${menuItems[index]['name']}');
              },
            ),
          );
        },
      ),
    );
  }
}
