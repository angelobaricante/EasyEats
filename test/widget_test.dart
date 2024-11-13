import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easyeats/featured_recipe.dart'; // Import your featured_recipe.dart file

void main() {
  testWidgets('Featured Recipe page loads correctly', (WidgetTester tester) async {
    // Build the FeaturedRecipe widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: FeaturedRecipePage()));

    // Verify that the title is displayed correctly.
    expect(find.text('Creamy Tuscan Chicken Pasta'), findsOneWidget);

    // Verify that the description is displayed correctly.
    expect(find.text('A delightful blend of Italian flavors in a creamy sauce'), findsOneWidget);

    // Verify that the "Start Cooking" button is present.
    expect(find.text('View Recipe'), findsOneWidget);

    // Optionally: Tap the "Start Cooking" button and verify an action (or the absence of an error).
    await tester.tap(find.text('View Recipe'));
    await tester.pump(); // Trigger any subsequent actions after tapping the button.

    // Since there might not be any state change, we're mainly verifying the widget's presence here.
  });
}
