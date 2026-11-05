import 'package:flutter_test/flutter_test.dart';
import 'package:assignment1/main.dart';

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
}
