import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/cosmic_home_page.dart';
import 'package:notes_app/favorite_planets.dart';
import 'package:notes_app/profile_page.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  int currentIndex = 0;

  List<Widget> pages = [
    CosmicHomePage(),
    FavoritePlanets(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 74,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(28)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildItem(0, 'assets/images/homeIcon.png', 'Home'),
                    _buildItem(1, 'assets/images/favoriteIcon.png', 'Favorite'),
                    _buildItem(2, 'assets/images/profileIcon.png', 'Profile'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(int index, String iconPath, String label) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            height: 24,
            color: isSelected ? Color(0xFF11DCE8) : const Color(0xFF8D8E99),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.figtree(
              fontWeight: FontWeight.w600,
              fontSize: 10,
              color: isSelected ? Color(0xFF11DCE8) : const Color(0xFF8D8E99),
            ),
          ),
        ],
      ),
    );
  }
}
