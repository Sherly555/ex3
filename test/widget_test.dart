import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Exam Schedule title test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ExamScheduleApp());

    // ✅ Check AppBar title
    expect(find.text('Exam Schedule'), findsOneWidget);

    // ✅ Check if list items are visible (adjust names to your subjects)
    expect(find.text('Mathematics'), findsOneWidget);
    expect(find.text('Physics'), findsOneWidget);
    expect(find.text('Chemistry'), findsOneWidget);
  });
}
