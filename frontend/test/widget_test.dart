import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:law_guide/login.dart';
import 'package:law_guide/main.dart';

void main() {
  testWidgets('Law Guide home page test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(LawGuideApp());

    // Verify that the title "Law Guide" is displayed.
    expect(find.text('Law Guide'), findsOneWidget);

    // Verify that the chatbot image exists.
    expect(find.byType(CircleAvatar), findsOneWidget);

    // Verify that the four buttons exist.
    expect(find.text("Lawyer\nConnectivity"), findsOneWidget);
    expect(find.text("News"), findsOneWidget);
    expect(find.text("Articles"), findsOneWidget);
    expect(find.text("Awareness"), findsOneWidget);

    // Tap on the Login/Sign up button
    await tester.tap(find.text('Login/Sign up'));
    await tester.pump();

    // Ensure that navigation happens
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
