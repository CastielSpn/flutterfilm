import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_list_screen.dart';

void main() {
  testWidgets('Displays search hint text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MovieListScreen()));
    expect(find.text('Search Movies'), findsOneWidget);
  });
}
