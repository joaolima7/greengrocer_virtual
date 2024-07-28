import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/tabs/home_tab_controller.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/components/category_tile.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/components/item_tile.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/components/text_field_custom.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/app_data.dart'
    as appData;

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TextEditingController _txtSearch = TextEditingController();
  final GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  final HomeTabController homecontroller = GetIt.I.get<HomeTabController>();
  late Function(GlobalKey) runAddToCartAnimation;
  var _cartQuantityItems = appData.cartItems.length;

  void addToCart(GlobalKey gkImage, Item item) async {
    await runAddToCartAnimation(gkImage);
    await cartKey.currentState!
        .runCartAnimation((++_cartQuantityItems).toString());

    setState(() {
      bool itemInCart = false;

      for (var cartItem in appData.cartItems) {
        if (cartItem.item.itemName == item.itemName) {
          cartItem.quantity++;
          itemInCart = true;
          break;
        }
      }

      if (!itemInCart) {
        appData.cartItems.add(CartItem(item: item, quantity: 1));
      }
    });
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
            Padding(
              padding: EdgeInsets.only(right: sizeScreen.width * .03),
              child: AddToCartIcon(
                key: cartKey,
                icon: const Icon(Icons.shopping_cart),
                badgeOptions: const BadgeOptions(
                  active: true,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
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
              child: TextFieldCustom(
                controller: _txtSearch,
                prefixIcon: Icon(Icons.search_rounded),
                hintText: 'Pesquise aqui...',
                containBorder: false,
              ),
            ),
            GetX<HomeTabController>(
              init: homecontroller, // Inicializando o controlador
              builder: (controller) {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.allCategories.isEmpty) {
                  return const Center(
                      child: Text("Nenhuma categoria encontrada"));
                }
                return Padding(
                  padding: EdgeInsets.only(bottom: sizeScreen.width * .04),
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    height: sizeScreen.width * .063,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        var category = controller.allCategories[index];
                        return CategoryTile(
                          category: category.name,
                          isSelected:
                              category == controller.currentCategory.value,
                          sizeScreen: sizeScreen.width,
                          onPressed: () {
                            controller.selectCategory(category);
                          },
                        );
                      },
                      separatorBuilder: (_, index) => SizedBox(
                        width: sizeScreen.width * .03,
                      ),
                      itemCount: controller.allCategories.length,
                    ),
                  ),
                );
              },
            ),
            GetX<HomeTabController>(
              init: homecontroller,
              builder: (controller) {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.allItems.isEmpty) {
                  return const Center(child: Text("Nenhum item encontrado"));
                }
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
