import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creamy Tuscan Chicken Pasta'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://via.placeholder.com/400x200',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildIngredientsList(),
                  const SizedBox(height: 24),
                  const Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildInstructionsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientsList() {
    final ingredients = [
      '1 lb boneless, skinless chicken breasts, cut into bite-sized pieces',
      '2 tbsp olive oil',
      '4 cloves garlic, minced',
      '1 cup heavy cream',
      '1/2 cup chicken broth',
      '1/2 cup grated Parmesan cheese',
      '1 cup chopped spinach',
      '1/2 cup sun-dried tomatoes, chopped',
      '1 tsp dried Italian herbs',
      'Salt and pepper to taste',
      '12 oz fettuccine pasta, cooked according to package instructions',
    ];

    return Column(
      children: ingredients
          .map((ingredient) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: Text(
                        ingredient,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _buildInstructionsList() {
    final instructions = [
      'In a large skillet, heat olive oil over medium-high heat. Add chicken pieces and cook until golden brown and cooked through, about 6-8 minutes. Remove chicken from the skillet and set aside.',
      'In the same skillet, add minced garlic and cook for 1 minute until fragrant.',
      'Pour in the heavy cream and chicken broth. Bring to a simmer and cook for 2-3 minutes until slightly thickened.',
      'Add Parmesan cheese, spinach, sun-dried tomatoes, and Italian herbs. Stir until the cheese is melted and the spinach is wilted.',
      'Return the cooked chicken to the skillet and stir to combine. Season with salt and pepper to taste.',
      'Add the cooked fettuccine to the skillet and toss everything together until the pasta is well coated with the sauce.',
      'Serve hot, garnished with additional Parmesan cheese and fresh basil if desired.',
    ];

    return Column(
      children: instructions
          .asMap()
          .entries
          .map((entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${entry.key + 1}. ',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text(
                        entry.value,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}