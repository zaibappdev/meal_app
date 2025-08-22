import 'package:flutter/material.dart';

class MealsDetailScreen extends StatefulWidget {
  const MealsDetailScreen({super.key});

  @override
  State<MealsDetailScreen> createState() => _MealsDetailScreenState();
}

class _MealsDetailScreenState extends State<MealsDetailScreen> {
  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorite
              ? "Meal added as favorite"
              : "Meal removed from favorites",
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Dummy static data (UI-only)
    final mealTitle = "Spaghetti Bolognese";
    final mealImage =
        "https://images.unsplash.com/photo-1603079840848-1a9f6a8b2da3?w=1200";
    final ingredients = [
      "200g Spaghetti",
      "100g Beef",
      "Tomato Sauce",
      "Onion",
      "Garlic",
    ];
    final steps = [
      "Boil spaghetti until al dente.",
      "Cook beef in a pan until brown.",
      "Add onion, garlic, and tomato sauce.",
      "Mix spaghetti with sauce.",
      "Serve hot and enjoy!",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealTitle,
          style: TextStyle(fontSize: screenSize.width * 0.05),
        ),
        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                _isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(_isFavorite),
                size: screenSize.width * 0.07,
              ),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.7, end: 1).animate(animation),
                  child: child,
                );
              },
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Meal Image
            Hero(
              tag: "meal-detail-hero", // static tag (UI only)
              child: Image.network(
                mealImage,
                height: screenSize.height * 0.3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),

            // Ingredients Section
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: screenSize.width * 0.05,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            ...ingredients.map(
              (ingredient) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  ingredient,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: screenSize.width * 0.04,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),

            SizedBox(height: screenSize.height * 0.03),

            // Steps Section
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: screenSize.width * 0.05,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            ...steps.map(
              (step) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.05,
                  vertical: screenSize.height * 0.01,
                ),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: screenSize.width * 0.04,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
