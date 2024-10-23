import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NavigationTabs {
  static const int home = 0;
  static const int cart = 1;
  static const int orders = 2;
  static const int profile = 3;
}

class NavigationController extends GetxController {
  final PageController _pageController = PageController();
  RxInt _currentIndex = 0.obs;

  PageController get pageController => _pageController;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int index) {
    _currentIndex.value = index;
  }

  void navigatePageView(int page) {
    if (_currentIndex.value == page) return;

    _pageController.animateToPage(
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 300),
      page,
    );
    _currentIndex.value = page;
  }
}
