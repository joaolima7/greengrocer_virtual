import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/tabs/home_tab_controller.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/components/category_tile.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/components/item_tile.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/components/text_field_custom.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/app_data.dart'
    as appData;
import 'package:greengrocer_virtual/src/layers/presentation/ui/widgets/shimmer_custom.dart';

import '../../../../controllers/get_controllers/tabs/cart_tab_controller.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TextEditingController _txtSearch = TextEditingController();
  final GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  final HomeTabController homecontroller = GetIt.I.get<HomeTabController>();
  final CartTabController _cartTabController = GetIt.I.get<CartTabController>();
  late Function(GlobalKey) runAddToCartAnimation;
  var _cartQuantityItems = appData.cartItems.length;

  void addToCart(GlobalKey gkImage, Item item) async {
    // Execute the add to cart animation
    await runAddToCartAnimation(gkImage);
    await cartKey.currentState!.runCartAnimation();

    // Check if the item is already in the cart
    CartItem? existingCartItem;
    await _cartTabController.getCartItems();

    for (var cartItem in _cartTabController.allCartItems) {
      if (cartItem.item.id == item.id) {
        existingCartItem = cartItem;
        break;
      }
    }

    if (existingCartItem != null) {
      // Increase quantity if item exists
      existingCartItem.quantity += 1;
      await _cartTabController.updateCartItem(existingCartItem);
    } else {
      // Add new item to cart
      CartItem newCartItem = CartItem(
        item: item,
        quantity: 1,
        objectId: '',
      );
      await _cartTabController.addCartItem(newCartItem);
    }
  }

  @override
  void initState() {
    super.initState();
    homecontroller.loadAllCategories();
    homecontroller.loadAllItems();
  }

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return AddToCartAnimation(
      cartKey: cartKey,
      height: 30,
      width: 30,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        duration: Duration(milliseconds: 100),
        curve: Curves.bounceInOut,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCartAnimation) {
        this.runAddToCartAnimation = runAddToCartAnimation;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'GreenGrocer',
            style: TextStyle(
                fontSize: sizeScreen.width * .065, color: Colors.white),
          ),
          actions: [
            GetX<CartTabController>(
              init: _cartTabController,
              builder: (controller) {
                return Padding(
                  padding: EdgeInsets.only(right: sizeScreen.width * .03),
                  child: AddToCartIcon(
                    key: cartKey,
                    icon: const Icon(Icons.shopping_cart),
                    badgeOptions: BadgeOptions(
                      active: controller.allCartItems.length > 0,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    badgeCount: controller.allCartItems.length.toString(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(
                sizeScreen.width * .05,
                sizeScreen.width * .05,
                sizeScreen.width * .05,
                sizeScreen.width * .05,
              ),
              child: GetX<HomeTabController>(
                init: homecontroller,
                builder: (controller) {
                  return TextFieldCustom(
                    onSubmitted: (value) {
                      controller.selectSearch(value);
                      controller.getItemsByName(controller.search.value);
                    },
                    controller: _txtSearch,
                    prefixIcon: Icon(Icons.search_rounded),
                    hintText: 'Pesquise aqui...',
                    containBorder: false,
                    onChanged: (value) {
                      controller.selectSearch(value);
                    },
                    sufixIcon: controller.search.value != ''
                        ? Icon(Icons.close)
                        : null,
                    onSuffixIconPressed: () {
                      _txtSearch.clear();
                      controller.selectSearch('');
                      controller.getItemsByName('');
                      FocusScope.of(context).unfocus();
                    },
                  );
                },
              ),
            ),
            GetX<HomeTabController>(
              init: homecontroller, // Inicializando o controlador
              builder: (controller) {
                return Padding(
                  padding: EdgeInsets.only(bottom: sizeScreen.width * .04),
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    height: sizeScreen.width * .063,
                    child: !controller.isLoading.value
                        ? ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              var category = controller.allCategories[index];
                              return CategoryTile(
                                category: category.name,
                                isSelected: category ==
                                    controller.currentCategory.value,
                                sizeScreen: sizeScreen.width,
                                onPressed: () {
                                  controller.selectCategory(category);
                                  controller.getItemsByCategory();
                                },
                              );
                            },
                            separatorBuilder: (_, index) => SizedBox(
                              width: sizeScreen.width * .03,
                            ),
                            itemCount: controller.allCategories.length,
                          )
                        : ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return CustomShimmer(
                                width: 80,
                                height: 20,
                                borderRadius: BorderRadius.circular(20),
                              );
                            },
                            separatorBuilder: (_, index) => SizedBox(
                              width: sizeScreen.width * .03,
                            ),
                            itemCount: 10,
                          ),
                  ),
                );
              },
            ),
            GetX<HomeTabController>(
              init: homecontroller,
              builder: (controller) {
                if (controller.isLoading.value) {
                  return Expanded(
                    child: GridView.count(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 11.5,
                      children: List.generate(
                        10,
                        (index) => CustomShimmer(
                          width: double.infinity,
                          height: double.infinity,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  );
                } else if (controller.allItems.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off,
                        color: MaterialTheme.lightScheme().primary,
                        size: sizeScreen.width * .09,
                      ),
                      Text(
                        'Nenhum item encontrado nessa categoria.',
                        style: TextStyle(
                          fontSize: sizeScreen.width * .045,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                      ),
                      itemCount: controller.allItems.length,
                      itemBuilder: (_, index) {
                        var item = controller.allItems[index];
                        return ItemTile(
                          item: item,
                          size: sizeScreen.width,
                          addToCart: addToCart,
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
