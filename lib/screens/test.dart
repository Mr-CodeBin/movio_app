import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent, // Transparent app bar
            expandedHeight: 200.0,
            floating: false,
            pinned: true, // App bar remains visible when scrolled
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              title: const Text("MOVIO"),
              centerTitle: true,
              background: Image.network(
                'https://example.com/your-image.jpg', // Replace with your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Add your content here
                Container(
                  height: 1000, // For scroll effect
                  color: ThemeData.dark().scaffoldBackgroundColor,
                  child: const Center(
                    child: Text(
                      "Content Below App Bar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GNav(
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
          GButton(
            icon: Icons.account_circle,
            text: 'Profile',
            iconSize: 24,
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
