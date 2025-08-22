import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title});

  final String? title;

  void _selectMeal(BuildContext context, String mealTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Meal: $mealTitle'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    // Dummy static meals (UI-only)
    final meals = ["Pizza", "Burger", "Pasta", "Salad"];

    Widget content = Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.no_meals,
              size: screenSize.width * 0.2,
              color: theme.colorScheme.onPrimaryContainer.withOpacity(0.7),
            ),
            const SizedBox(height: 20),
            Text(
              "Uh oh... nothing here!",
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              "Try selecting a different category!",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onPrimaryContainer.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          final mealTitle = meals[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.fastfood),
              title: Text(
                mealTitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: screenSize.width * 0.045,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _selectMeal(context, mealTitle),
            ),
          );
        },
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!), centerTitle: true),
      body: content,
    );
  }
}
