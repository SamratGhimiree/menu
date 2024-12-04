import 'package:flutter/material.dart';

import 'AddMenuItem.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
        backgroundColor: Colors.blueGrey,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        padding: EdgeInsets.all(16),
        children: [
          AdminOption(
            icon: Icons.add,
            label: 'Add Item',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMenuItem()),
              );
            },
          ),

          AdminOption(
            icon: Icons.edit,
            label: 'Edit Item',
            onTap: () {
              // Navigate to Edit Item screen
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Edit Item coming soon!')),
              );
            },
          ),
          AdminOption(
            icon: Icons.delete,
            label: 'Remove Item',
            onTap: () {
              // Navigate to Remove Item screen
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Remove Item coming soon!')),
              );
            },
          ),
          AdminOption(
            icon: Icons.list_alt,
            label: 'View Orders',
            onTap: () {
              // Navigate to View Orders screen
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('View Orders coming soon!')),
              );
            },
          ),

        ],
      ),
    );
  }
}

class AdminOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  AdminOption({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
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
