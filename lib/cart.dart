import 'menu.dart';

class Cart {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(MenuItem menuItem) {
    // Check if the item already exists
    final existingItem = _items.firstWhere(
          (item) => item.menuItem.name == menuItem.name,
      orElse: () => CartItem(menuItem: menuItem, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity += 1;
    } else {
      _items.add(CartItem(menuItem: menuItem, quantity: 1));
    }
  }

  void removeItem(MenuItem menuItem) {
    _items.removeWhere((item) => item.menuItem.name == menuItem.name);
  }

  void clearCart() {
    _items.clear();
  }
}

class CartItem {
  final MenuItem menuItem;
  int quantity;

  CartItem({required this.menuItem, required this.quantity});
}
