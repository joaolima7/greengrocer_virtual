import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/cart_datasources/update_cart_item_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/cart_repositories/update_cart_item_repository.dart';

class UpdateCartItemRepositoryImp implements UpdateCartItemRepository {
  UpdateCartItemDataSource _updateCartItemDataSource;
  UpdateCartItemRepositoryImp(this._updateCartItemDataSource);

  @override
  Future<CartItem> call(String userId, CartItem cartItem) async {
    return await _updateCartItemDataSource(userId, cartItem);
  }
}
