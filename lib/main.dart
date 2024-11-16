import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popular Recipes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PopularRecipesScreen(),
    );
  }
}

class PopularRecipesScreen extends StatelessWidget {
  const PopularRecipesScreen({super.key});

  final List<Map<String, dynamic>> recipes = const [
    {
      "title": "Spaghetti Bolognese",
      "description": "A classic Italian pasta dish with rich tomato sauce.",
      "servings": "4 servings",
      "time": "45 min",
      "imageUrl": "https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2021/06/THUMB-LINK-2020-2.jpg?im=AspectCrop=(16,9);Resize,width=570",
      "ingredients": [
        "200g spaghetti",
        "100g minced beef",
        "1 can of tomatoes",
        "1 onion",
        "2 garlic cloves",
        "Salt and pepper"
      ],
      "steps": [
        "Boil the spaghetti until al dente.",
        "Sauté the onion and garlic.",
        "Add minced beef and cook until browned.",
        "Add tomatoes, salt, and pepper and simmer.",
        "Serve sauce over spaghetti."
      ],
    },
    {
      "title": "Chicken Caesar Salad",
      "description": "Crispy romaine lettuce with grilled chicken and Caesar dressing.",
      "servings": "2 servings",
      "time": "20 min",
      "imageUrl": "https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2024/08/caesar-salad.jpg?im=Resize,width=570",
      "ingredients": [
        "1 romaine lettuce",
        "100g grilled chicken",
        "Caesar dressing",
        "Parmesan cheese",
        "Croutons"
      ],
      "steps": [
        "Chop the romaine lettuce.",
        "Add grilled chicken, dressing, Parmesan, and croutons.",
        "Toss everything together and serve."
      ],
    },
    {
      "title": "Chocolate Brownies",
      "description": "Rich and fudgy chocolate brownies.",
      "servings": "8 servings",
      "time": "30 min",
      "imageUrl": "https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2023/05/brownies.jpg?im=AspectCrop=(16,9);Resize,width=570",
      "ingredients": [
        "200g dark chocolate",
        "150g butter",
        "200g sugar",
        "3 eggs",
        "100g flour",
        "1 tsp vanilla extract"
      ],
      "steps": [
        "Melt the chocolate and butter together.",
        "Mix in sugar, eggs, and vanilla.",
        "Add flour and stir until combined.",
        "Bake at 180°C for 20-25 minutes."
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Recipes",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to view all recipes
                  },
                  child: const Text("View All"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          builder: (context) {
                            return RecipeDetailSheet(
                              title: recipe["title"],
                              description: recipe["description"],
                              servings: recipe["servings"],
                              time: recipe["time"],
                              ingredients: List<String>.from(recipe["ingredients"]),
                              steps: List<String>.from(recipe["steps"]),
                            );
                          },
                        );
                      },
                      child: RecipeCard(
                        title: recipe["title"],
                        description: recipe["description"],
                        servings: recipe["servings"],
                        time: recipe["time"],
                        imageUrl: recipe["imageUrl"],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String description;
  final String servings;
  final String time;
  final String imageUrl;

  const RecipeCard({
    required this.title,
    required this.description,
    required this.servings,
    required this.time,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.people, size: 16, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(servings, style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 16, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(time, style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeDetailSheet extends StatelessWidget {
  final String title;
  final String description;
  final String servings;
  final String time;
  final List<String> ingredients;
  final List<String> steps;

  const RecipeDetailSheet({
    required this.title,
    required this.description,
    required this.servings,
    required this.time,
    required this.ingredients,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            controller: scrollController,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              Text(
                "Servings: $servings",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Time: $time",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              for (var ingredient in ingredients)
                Text("• $ingredient", style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 16),
              Text(
                "Steps",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              for (var i = 0; i < steps.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    "${i + 1}. ${steps[i]}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
