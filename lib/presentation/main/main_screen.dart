import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/presentation/cart/cart_screen.dart';
import 'package:my_profile/presentation/home/home_screen.dart';
import 'package:my_profile/presentation/main/main_controller.dart';
import 'package:my_profile/presentation/profile/profile_screen.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listNavigation = const [
      HomeScreen(),
      CartScreen(),
      ProfileScreen()
    ];
    return Obx((){
      return Scaffold(
        body: IndexedStack(
          index: controller.selectedNavIndexObs.value,
          children: listNavigation,
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) => controller.navigateTo(index),
          selectedIndex: controller.selectedNavIndexObs.value,
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
    });
  }
}
