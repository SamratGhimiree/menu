import 'package:flutter/material.dart';
import 'menu.dart';
import 'cart.dart';

class CartPage extends StatelessWidget {
  final Cart cart;

  CartPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: cart.items.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final cartItem = cart.items[index];
          return ListTile(
            leading: Image.asset(
              cartItem.menuItem.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(cartItem.menuItem.name),
            subtitle: Text('Quantity: ${cartItem.quantity}'),
            trailing: Text('Rs. ${(cartItem.menuItem.price * cartItem.quantity).toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: cart.items.isNotEmpty
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Simulate placing the order
            cart.clearCart();
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Order placed successfully!')),
            );
          },
          child: Text('Place Order'),
        ),
      )
          : null,
    );
  }
}
