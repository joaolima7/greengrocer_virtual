import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/category_tile.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/item_tile.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/text_field_custom.dart';
import 'package:greengrocer_virtual/src/core/app_data/app_data.dart' as appData;

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController _txtSearch = TextEditingController();
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  var _cartQuantityItems = appData.cartItems.length;

  String _selectedCategory = 'Frutas';

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
              padding: EdgeInsets.only(
                right: sizeScreen.width * .03,
              ),
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
            Padding(
              padding: EdgeInsets.only(
                bottom: sizeScreen.width * .04,
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 5),
                height: sizeScreen.width * .063,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return CategoryTile(
                      category: appData.categories[index],
                      isSelected:
                          appData.categories[index] == _selectedCategory,
                      sizeScreen: sizeScreen.width,
                      onPressed: () {
                        setState(() {
                          _selectedCategory = appData.categories[index];
                        });
                      },
                    );
                  },
                  separatorBuilder: (_, index) => SizedBox(
                    width: sizeScreen.width * .03,
                  ),
                  itemCount: appData.categories.length,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
                ),
                itemCount: appData.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(
                    item: appData.items[index],
                    size: sizeScreen.width,
                    addToCart: addToCart,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
