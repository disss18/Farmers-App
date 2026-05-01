import 'package:flutter_test/flutter_test.dart';

import 'package:farmers_app/main.dart';

void main() {
  testWidgets('Farmers app renders home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('Categories'), findsOneWidget);
    expect(find.text('Browse Products'), findsOneWidget);
    expect(find.text('Berries'), findsOneWidget);
  });
}
