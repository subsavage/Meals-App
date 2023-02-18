import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../screens/favourites_screen.dart';
import '../screens/categories_screen.dart';

class tabsScreen extends StatefulWidget {
  @override
  State<tabsScreen> createState() => _tabsScreenState();
}

class _tabsScreenState extends State<tabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': Categories(), 'title': 'Categories'},
    {'page': favouritesScreen(), 'title': 'Your Favourites'},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: mainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Color.fromARGB(255, 225, 195, 195),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.pinkAccent,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
