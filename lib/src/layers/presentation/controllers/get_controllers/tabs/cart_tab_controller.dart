import 'package:get/get.dart';
import 'package:greengrocer_virtual/src/core/utils/utils_dialogs.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/add_cart_item_usecase/add_cart_item_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/get_all_cart_items_usecase/get_all_cart_items_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/remove_cart_item_usecase/remove_cart_item_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/update_cart_item_usecase/update_cart_item_usecase.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/auth/auth_controller.dart';
import '../../../../domain/entities/cart_item.dart';

class CartTabController extends GetxController {
  final GetAllCartItemsUseCase _getAllCartItemsUseCase;
  final UpdateCartItemUseCase _updateCartItemUseCase;
  final AddCartItemUseCase _addCartItemUseCase;
  final RemoveCartItemUseCase _removeCartItemUseCase;
  final AuthController _authController;

  CartTabController(
    this._getAllCartItemsUseCase,
    this._updateCartItemUseCase,
    this._addCartItemUseCase,
    this._authController,
    this._removeCartItemUseCase,
  );

  RxBool isLoading = false.obs;
  RxList<CartItem> allCartItems = <CartItem>[].obs;
  RxBool isItemInCart = false.obs;

  Future<void> getCartItems() async {
    isLoading.value = true;

    try {
      var result =
          await _getAllCartItemsUseCase(_authController.user.value.id!);
      if (result.isNotEmpty) {
        allCartItems.value = result;
      } else {
        allCartItems.value = [];
      }
    } catch (e) {
      UtilsDialogs.showToast(message: e.toString(), sizeWidth: 300);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addCartItem(CartItem cartItem) async {
    isLoading.value = true;

    try {
      await _addCartItemUseCase(cartItem, _authController.user.value.id!);
      await getCartItems();
    } catch (e) {
      UtilsDialogs.showToast(message: e.toString(), sizeWidth: 300);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateCartItem(CartItem cartItem) async {
    isLoading.value = true;

    try {
      await _updateCartItemUseCase(_authController.user.value.id!, cartItem);
      await getCartItems();
    } catch (e) {
      UtilsDialogs.showToast(message: e.toString(), sizeWidth: 300);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeCartItem(CartItem cartItem) async {
    isLoading.value = true;

    try {
      await _removeCartItemUseCase(
          _authController.user.value.id!, cartItem.objectId);
      await getCartItems();
    } catch (e) {
      UtilsDialogs.showToast(message: e.toString(), sizeWidth: 300);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkItemInCart(String itemId) async {
    isLoading.value = true;
    try {
      await getCartItems();
      isItemInCart.value = allCartItems.any((item) => item.item.id == itemId);
    } catch (e) {
      UtilsDialogs.showToast(message: e.toString(), sizeWidth: 300);
    } finally {
      isLoading.value = false;
    }
  }
}
