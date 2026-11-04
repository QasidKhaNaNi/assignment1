import 'package:flutter_test/flutter_test.dart';
import 'package:assignment1/main.dart';

void main() {
  testWidgets('Splash screen loads correctly and navigates', (WidgetTester tester) async {
    await tester.pumpWidget(const Assignment1App());

    // Verify that Assignment1 title is shown on splash screen
    expect(find.text('Assignment1'), findsOneWidget);
    expect(find.text('Premium Android Experience'), findsOneWidget);

    // Pump timer for 3 seconds to complete navigation
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Verify navigation to login placeholder
    expect(find.textContaining('Login Screen Placeholder'), findsOneWidget);
  });
}
