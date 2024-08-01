import 'package:get/get.dart';

import '../../../../domain/entities/cart_item.dart';

class CartTabController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CartItem> allCartItems = <CartItem>[].obs;

  Future<void> getCartItems() async {}

  Future<void> addCartItem() async {}

  Future<void> updateCartItem() async {}
}
