import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easyeats/main.dart';

void main() {
  testWidgets('PopularRecipesScreen displays recipe cards', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MyApp());

    // Verify the main title is displayed
    expect(find.text('Popular Recipes'), findsOneWidget);

    // Verify recipe cards are displayed
    expect(find.text('Spaghetti Bolognese'), findsOneWidget);
    expect(find.text('Chicken Caesar Salad'), findsOneWidget);
    expect(find.text('Chocolate Brownies'), findsOneWidget);
  });

  testWidgets('Tap on a recipe card shows the recipe detail sheet', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MyApp());

    // Tap on the first recipe card
    await tester.tap(find.text('Spaghetti Bolognese'));
    await tester.pumpAndSettle();

    // Verify the detail sheet is displayed
    expect(find.text('Spaghetti Bolognese'), findsWidgets); // Title in the bottom sheet
    expect(find.text('A classic Italian pasta dish with rich tomato sauce.'), findsOneWidget);

    // Verify ingredients and steps are displayed
    expect(find.text('Ingredients'), findsOneWidget);
    expect(find.textContaining('200g spaghetti'), findsOneWidget);

    // Verify steps are enumerated
    expect(find.text('1. Boil the spaghetti until al dente.'), findsOneWidget);
    expect(find.text('2. Sauté the onion and garlic.'), findsOneWidget);
  });
}
