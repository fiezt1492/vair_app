import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vair_app/controllers/auth_controller.dart';
import 'package:vair_app/routes/app_pages.dart';
import 'package:vair_app/screens/tabs/main_screen/profile_tab.dart';
import 'package:vair_app/screens/tabs/main_screen/home_tab.dart';
import 'package:vair_app/screens/tabs/main_screen/library_tab.dart';

class MainScreenController extends GetxController {
  final AuthController authController = Get.put(AuthController());
  late PageController pageController;
  var currentIndex = 0.obs;

  List<Widget> pages = <Widget>[
    const HomeTab(),
    const LibraryTab(),
    ProfileTab()
  ];

  void goToTab(int page) {
    currentIndex.value = page;
    pageController.jumpToPage(page);
    update();
  }

  void animateToTab(int page) {
    currentIndex.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    update();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
