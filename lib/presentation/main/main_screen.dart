import 'package:flutter/material.dart';
import 'package:my_profile/presentation/cart/cart_screen.dart';
import 'package:my_profile/presentation/home/home_screen.dart';
import 'package:my_profile/presentation/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> listNavigation = const [HomeScreen(), CartScreen(), ProfileScreen()];
    return Scaffold(
      body: listNavigation[navigationIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) => onNavigationChange(index),
        selectedIndex: navigationIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.explore_outlined),
            label: "Explore",
            selectedIcon: Icon(Icons.explore),),
          NavigationDestination(icon: Icon(Icons.shopping_basket_outlined),
              label: "Cart",
              selectedIcon: Icon(Icons.shopping_basket)),
          NavigationDestination(icon: Icon(Icons.person_outline),
              label: "Profile",
              selectedIcon: Icon(Icons.person)),
        ],
      ),
    );
  }
  onNavigationChange(int index) {
    setState(() {
      navigationIndex = index;
    });
  }
}
