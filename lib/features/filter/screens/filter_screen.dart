import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  // Local state variables (UI only)
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  void _showSnackMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filters',
          style: TextStyle(fontSize: screenSize.width * 0.05),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showSnackMessage("Filters saved (UI only)");
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: ListView(
        children: [
          // Gluten Free Filter
          SwitchListTile(
            value: _glutenFree,
            onChanged: (isChecked) {
              setState(() {
                _glutenFree = isChecked;
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: screenSize.width * 0.045,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: screenSize.width * 0.035,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.07,
            ),
          ),

          // Lactose Free Filter
          SwitchListTile(
            value: _lactoseFree,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFree = isChecked;
              });
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: screenSize.width * 0.045,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              'Only include lactose-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: screenSize.width * 0.035,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.07,
            ),
          ),

          // Vegetarian Filter
          SwitchListTile(
            value: _vegetarian,
            onChanged: (isChecked) {
              setState(() {
                _vegetarian = isChecked;
              });
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: screenSize.width * 0.045,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              'Only include vegetarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: screenSize.width * 0.035,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.07,
            ),
          ),

          // Vegan Filter
          SwitchListTile(
            value: _vegan,
            onChanged: (isChecked) {
              setState(() {
                _vegan = isChecked;
              });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: screenSize.width * 0.045,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: screenSize.width * 0.035,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.07,
            ),
          ),
        ],
      ),
    );
  }
}
