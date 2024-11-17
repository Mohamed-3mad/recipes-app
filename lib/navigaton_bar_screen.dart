import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes/utils/constants.dart';
import 'package:recipes/views/favorite/favorite_screen.dart';
import 'package:recipes/views/home/home_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int selectedIndex = 0;
  late final List<Widget> page;
  @override
  void initState() {
    super.initState();
    page = [
      const HomeScreen(),
      const FavoriteScreen(),
      navBarPage(Iconsax.calendar5),
      navBarPage(Iconsax.setting_21),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconSize: 28,
        currentIndex: selectedIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle:
            const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: selectedIndex == 0
                  ? const Icon(Iconsax.home5)
                  : const Icon(Iconsax.home_1),
              label: "Home"),
          BottomNavigationBarItem(
              icon: selectedIndex == 1
                  ? const Icon(Iconsax.heart5)
                  : const Icon(Iconsax.heart),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: selectedIndex == 2
                  ? const Icon(Iconsax.calendar5)
                  : const Icon(Iconsax.calendar),
              label: "Meal Plan"),
          BottomNavigationBarItem(
              icon: selectedIndex == 3
                  ? const Icon(Iconsax.setting_21)
                  : const Icon(Iconsax.setting_2),
              label: "Settings"),
        ],
      ),
      body: page[selectedIndex],
    );
  }

  navBarPage(iconName) {
    return Center(
      child: Icon(
        iconName,
        size: 100,
        color: kPrimaryColor,
      ),
    );
  }
}
