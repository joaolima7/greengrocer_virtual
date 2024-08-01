import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';

abstract class GetAllCartItemsDataSource {
  Future<List<CartItem>> call(String userId);
}
