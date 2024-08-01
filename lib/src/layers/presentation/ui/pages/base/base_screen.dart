import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/navigation/navigation_controller.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/pages/base/tabs/cart_tab.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/pages/base/tabs/home_tab.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/pages/base/tabs/orders_tab.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/pages/base/tabs/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final navigationController = GetIt.I.get<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: navigationController.pageController,
        children: [
          HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: navigationController.currentIndex,
            onTap: (index) {
              navigationController.navigatePageView(index);
              // _currentIndex = index;
              // _pageController.animateToPage(
              //   index,
              //   duration: Duration(milliseconds: 300),
              //   curve: Curves.easeIn,
              // );
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                activeIcon: Icon(Icons.shopping_cart),
                label: 'Carrinho',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                activeIcon: Icon(Icons.view_list),
                label: 'Pedidos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
          )),
    );
  }
}
