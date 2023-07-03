import 'package:get/get.dart';

class MainController extends GetxController{
  final selectedNavIndexObs = 0.obs;
  // int selectedNavIndex = 0;

  void navigateTo(int index) {
    // Obs
    selectedNavIndexObs.value = index;
  }
}