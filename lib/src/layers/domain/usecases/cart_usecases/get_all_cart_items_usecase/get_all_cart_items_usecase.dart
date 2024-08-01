import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';

abstract class GetAllCartItemsUseCase {
  Future<List<CartItem>> call(String userId);
}
