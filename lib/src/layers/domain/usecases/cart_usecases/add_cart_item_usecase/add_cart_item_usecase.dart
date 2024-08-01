import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';

abstract class AddCartItemUseCase {
  Future<CartItem> call(CartItem cartItem, String userId);
}
