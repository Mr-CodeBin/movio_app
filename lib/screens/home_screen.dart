import 'package:flutter/material.dart';
import 'package:movio/screens/movies_page.dart';
import 'package:movio/screens/search_screen.dart';
import 'package:movio/widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          MovioPage(),
          SearchScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
              );
            });
          }),
    );
  }
}
