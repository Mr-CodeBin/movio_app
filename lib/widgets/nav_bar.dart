import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  var selectedIndex;
  var onTabChange;

  BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      selectedIndex: selectedIndex,
      onTabChange: (index) {
        selectedIndex = index;
        onTabChange(index);
      },
      backgroundColor: Colors.black,
      color: Colors.white,
      activeColor: Colors.red,
      tabBackgroundColor: Colors.grey[800]!,
      gap: 8,
      tabMargin: const EdgeInsets.fromLTRB(4, 4, 4, 2),
      padding: const EdgeInsets.all(16),
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Home',
          iconSize: 24,
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        GButton(
          icon: Icons.search,
          text: 'Search',
          iconSize: 24,
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
