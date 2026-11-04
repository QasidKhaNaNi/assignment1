import 'package:flutter_test/flutter_test.dart';
import 'package:assignment1/main.dart';

void main() {
  testWidgets('Splash screen loads correctly and navigates to login', (WidgetTester tester) async {
    await tester.pumpWidget(const Assignment1App());

    // Verify splash screen elements
    expect(find.text('Assignment1'), findsOneWidget);

    // Pump timer to trigger navigation to login screen
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Verify login screen elements
    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
  });
}
