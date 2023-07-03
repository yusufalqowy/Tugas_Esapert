import 'package:get/get.dart';
import 'package:my_profile/presentation/detail_book/detail_book.dart';
import 'package:my_profile/presentation/detail_book/detail_book_binding.dart';
import 'package:my_profile/presentation/home/home_binding.dart';
import 'package:my_profile/presentation/home/home_screen.dart';
import 'package:my_profile/presentation/main/main_binding.dart';
import 'package:my_profile/presentation/main/main_screen.dart';
import 'package:my_profile/presentation/profile/profile_screen.dart';
import 'package:my_profile/presentation/search_book/search_book.dart';
import 'package:my_profile/presentation/search_book/search_book_binding.dart';
import 'package:my_profile/presentation/splash/splash_screen.dart';
import 'package:my_profile/route/routes.dart';

class Pages {
  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashScreen(),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: Routes.main,
        page: () => const MainScreen(),
        bindings: [
          MainBinding(),
          HomeBinding()
        ],
        transition: Transition.leftToRightWithFade
    ),
    GetPage(
        name: Routes.home,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: Routes.profile,
        page: () => const ProfileScreen(),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: Routes.detailBook,
        page: () => const DetailBookScreen(),
        binding: DetailBookBinding(),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: Routes.searchBook,
        page: () => const SearchBookScreen(),
        binding: SearchBookBinding(),
        transition: Transition.leftToRightWithFade),
  ];
}
