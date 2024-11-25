import 'package:flutter/material.dart';
import 'menu.dart';  // Import the menu.dart file

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(), // Set HomeScreen as the home page
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baje ko Chiya pasal'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Number of icons per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.all(16),
        children: [
          HomeIcon(
            icon: Icons.restaurant_menu,
            label: 'Menu',
            onTap: () {
              // Navigate to MenuScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuScreen()),
              );
            },
          ),
          HomeIcon(
            icon: Icons.receipt_long,
            label: 'Orders',
            onTap: () {
              // Navigate to Orders screen (replace with your screen)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Orders screen coming soon!')),
              );
            },
          ),
          HomeIcon(
            icon: Icons.table_bar,
            label: 'Tables',
            onTap: () {
              // Navigate to Tables screen (replace with your screen)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tables screen coming soon!')),
              );
            },
          ),
          HomeIcon(
            icon: Icons.settings,
            label: 'Settings',
            onTap: () {
              // Navigate to Settings screen (replace with your screen)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Settings screen coming soon!')),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HomeIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  HomeIcon({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
