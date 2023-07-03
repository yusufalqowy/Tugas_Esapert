import 'package:get/get.dart';
import 'package:my_profile/presentation/main/main_controller.dart';

class MainBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }

}