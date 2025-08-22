import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.title,
    required this.color,
    required this.onSelectCategory,
  });

  final String title;
  final Color color;
  final VoidCallback onSelectCategory;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; // For responsiveness

    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).colorScheme.onSurface,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(screenSize.width * 0.04), // responsive padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.55), color.withOpacity(0.85)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: screenSize.width * 0.05, // responsive font size
          ),
        ),
      ),
    );
  }
}
