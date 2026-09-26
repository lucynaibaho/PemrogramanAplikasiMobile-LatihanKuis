// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('login opens library and logout returns to login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Pink Shelf'), findsNothing);

    await tester.enterText(find.byType(TextField).at(0), 'Lucy Naibaho');
    await tester.enterText(find.byType(TextField).at(1), '124240040');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Daftar Buku'), findsOneWidget);

    await tester.tap(find.byTooltip('Keluar dan kembali ke login'));
    await tester.pumpAndSettle();

    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Daftar Buku'), findsNothing);
  });
}
