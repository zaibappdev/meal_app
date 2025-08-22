import 'package:flutter/material.dart';

// Dummy Categories
const availableCategories = [
  {'id': 'c1', 'title': 'Italian', 'color': Colors.purple},
  {'id': 'c2', 'title': 'Quick & Easy', 'color': Colors.red},
  {'id': 'c3', 'title': 'Hamburger', 'color': Colors.orange},
  {'id': 'c4', 'title': 'German', 'color': Colors.amber},
  {'id': 'c5', 'title': 'Light & Lovely', 'color': Colors.blue},
  {'id': 'c6', 'title': 'Exotic', 'color': Colors.green},
  {'id': 'c7', 'title': 'Breakfast', 'color': Colors.lightBlue},
  {'id': 'c8', 'title': 'Asian', 'color': Colors.lightGreen},
  {'id': 'c9', 'title': 'French', 'color': Colors.pink},
  {'id': 'c10', 'title': 'Summer', 'color': Colors.teal},
];

// Dummy Meals
final dummyMeals = [
  {
    'id': 'm1',
    'categories': ['c1', 'c2'],
    'title': 'Spaghetti with Tomato Sauce',
    'affordability': 'Affordable',
    'complexity': 'Simple',
    'imageUrl':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    'duration': 20,
    'ingredients': [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)',
    ],
    'steps': [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heat up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.',
    ],
    'isGlutenFree': false,
    'isVegan': true,
    'isVegetarian': true,
    'isLactoseFree': true,
  },
  {
    'id': 'm5',
    'categories': ['c2', 'c5', 'c10'],
    'title': 'Salad with Smoked Salmon',
    'affordability': 'Luxurious',
    'complexity': 'Simple',
    'imageUrl':
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    'duration': 15,
    'ingredients': [
      'Arugula',
      'Lamb\'s Lettuce',
      'Parsley',
      'Fennel',
      '200g Smoked Salmon',
      'Mustard',
      'Balsamic Vinegar',
      'Olive Oil',
      'Salt and Pepper',
    ],
    'steps': [
      'Wash and cut salad and herbs',
      'Dice the salmon',
      'Process mustard, vinegar and olive oil into a dressing',
      'Prepare the salad',
      'Add salmon cubes and dressing',
    ],
    'isGlutenFree': true,
    'isVegan': false,
    'isVegetarian': true,
    'isLactoseFree': true,
  },
];
