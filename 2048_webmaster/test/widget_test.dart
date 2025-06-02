import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:2048_webmaster/main.dart';

void main() {
  testWidgets('App generation message displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('2048_webmaster App is being generated...'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('App bar has correct title', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('2048_webmaster'), findsOneWidget);
  });
}
