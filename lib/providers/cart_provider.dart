import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};
  final Set<String> _favorites = {};

  List<CartItem> get items => _items.values.toList();
  Set<String> get favorites => Set.unmodifiable(_favorites);

  int get itemCount {
    int total = 0;
    for (var item in _items.values) {
      total += item.quantity;
    }
    return total;
  }

  int get uniqueItemCount => _items.length;

  double get subtotal {
    double total = 0.0;
    for (var item in _items.values) {
      total += item.totalPrice;
    }
    return total;
  }

  double get deliveryCharge => subtotal > 0 ? (subtotal > 200 ? 0.0 : 15.0) : 0.0;

  double get totalPrice => subtotal + deliveryCharge;

  bool isFavorite(String productId) {
    return _favorites.contains(productId);
  }

  void toggleFavorite(String productId) {
    if (_favorites.contains(productId)) {
      _favorites.remove(productId);
    } else {
      _favorites.add(productId);
    }
    notifyListeners();
  }

  int getQuantity(String productId) {
    return _items[productId]?.quantity ?? 0;
  }

  void addToCart(Product product, {int quantity = 1}) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += quantity;
    } else {
      _items[product.id] = CartItem(product: product, quantity: quantity);
    }
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity) {
    if (!_items.containsKey(productId)) return;
    if (quantity <= 0) {
      _items.remove(productId);
    } else {
      _items[productId]!.quantity = quantity;
    }
    notifyListeners();
  }

  void incrementQuantity(String productId) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(String productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!.quantity > 1) {
        _items[productId]!.quantity--;
      } else {
        _items.remove(productId);
      }
      notifyListeners();
    }
  }

  void removeFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    if (listen) {
      final scope = context.dependOnInheritedWidgetOfExactType<_CartInheritedScope>();
      return scope!.notifier!;
    } else {
      final scope = context.findAncestorWidgetOfExactType<_CartInheritedScope>();
      return scope!.notifier!;
    }
  }
}

class CartScope extends StatelessWidget {
  final CartProvider notifier;
  final Widget child;

  const CartScope({
    super.key,
    required this.notifier,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return _CartInheritedScope(
      notifier: notifier,
      child: child,
    );
  }
}

class _CartInheritedScope extends InheritedNotifier<CartProvider> {
  const _CartInheritedScope({
    required CartProvider notifier,
    required super.child,
  }) : super(notifier: notifier);
}
