import 'package:flutter_test/flutter_test.dart';
import 'package:assignment1/main.dart';
import 'package:assignment1/models/product.dart';
import 'package:assignment1/providers/cart_provider.dart';
import 'package:assignment1/screens/home_screen.dart';
import 'package:assignment1/screens/product_listing_screen.dart';
import 'package:assignment1/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Full auth flow: Splash -> Login -> Signup loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const Assignment1App());

    // Splash screen check
    expect(find.text('Assignment1'), findsOneWidget);

    // Pump timer to navigate to Login
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Login screen check
    expect(find.text('Welcome Back'), findsOneWidget);

    // Ensure Sign Up button is visible and tap it
    final signUpFinder = find.text('Sign Up');
    await tester.ensureVisible(signUpFinder);
    await tester.tap(signUpFinder);
    await tester.pumpAndSettle();

    // Signup screen check
    expect(find.text('Create Account'), findsNWidgets(2));
    expect(find.text('Full Name'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);
  });

  testWidgets('Home screen renders dashboard cards and product entry', (WidgetTester tester) async {
    final cartProvider = CartProvider();
    await tester.pumpWidget(
      CartScope(
        notifier: cartProvider,
        child: const MaterialApp(
          home: HomeScreen(userName: 'Qasid Khanani'),
        ),
      ),
    );

    expect(find.text('Welcome back,'), findsOneWidget);
    expect(find.text('Qasid Khanani'), findsOneWidget);
    expect(find.text('Dashboard Overview'), findsOneWidget);
    expect(find.text('Store Catalog'), findsOneWidget);
    expect(find.text('Browse Products'), findsOneWidget);
  });

  testWidgets('Product listing screen renders products, search and filters', (WidgetTester tester) async {
    final cartProvider = CartProvider();
    await tester.pumpWidget(
      CartScope(
        notifier: cartProvider,
        child: const MaterialApp(
          home: ProductListingScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Premium Store'), findsOneWidget);
    expect(find.text('Wireless Pro Headphones'), findsOneWidget);
    expect(find.text('Smart Watch Ultra'), findsOneWidget);

    // Search filter test
    await tester.enterText(find.byType(TextField), 'Smart Watch');
    await tester.pumpAndSettle();

    expect(find.text('Smart Watch Ultra'), findsOneWidget);
    expect(find.text('Wireless Pro Headphones'), findsNothing);
  });

  testWidgets('Product details screen renders specifications and updates cart', (WidgetTester tester) async {
    final cartProvider = CartProvider();
    final testProduct = Product.sampleProducts.first;

    await tester.pumpWidget(
      CartScope(
        notifier: cartProvider,
        child: MaterialApp(
          home: ProductDetailsScreen(product: testProduct),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Product Details'), findsOneWidget);
    expect(find.text(testProduct.name), findsOneWidget);
    expect(find.text('Specifications'), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);

    // Tap Add to Cart
    await tester.tap(find.text('Add to Cart'));
    await tester.pumpAndSettle();

    expect(cartProvider.itemCount, equals(1));
  });
}
