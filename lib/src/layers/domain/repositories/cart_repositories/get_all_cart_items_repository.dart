import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';

abstract class GetAllCartItemsRepository {
  Future<List<CartItem>> call(String userId);
}
