import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';

abstract class UpdateCartItemRepository {
  Future<CartItem> call(String userId, CartItem cartItem);
}
