import 'package:flutter/material.dart';
import '../categories/screens/categories.dart';
import '../filter/screens/filter_screen.dart';
import '../meal/screens/meals.dart';
import '../../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  /// Bottom navigation page switcher
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  /// Handles navigation from drawer (UI only now)
  void _setScreen(String identifier) {
    Navigator.of(context).pop(); // Close drawer
    if (identifier == 'filters') {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; // For responsiveness

    // Active Page (UI only)
    Widget activePage = const CategoriesScreen();
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = const MealsScreen(title: 'Your Favorites');
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle,
          style: TextStyle(
            fontSize: screenSize.width * 0.05, // Responsive font size
          ),
        ),
      ),

      // Drawer
      drawer: MainDrawer(onSelectScreen: _setScreen),

      // Body
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.02), // Responsive padding
        child: activePage,
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        selectedFontSize: screenSize.width * 0.035,
        unselectedFontSize: screenSize.width * 0.03,
        iconSize: screenSize.width * 0.07,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
