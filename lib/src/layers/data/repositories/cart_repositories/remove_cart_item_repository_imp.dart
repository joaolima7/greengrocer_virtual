import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/cart_datasources/remove_cart_item_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/cart_repositories/remove_cart_item_repository.dart';

class RemoveCartItemRepositoryImp implements RemoveCartItemRepository {
  RemoveCartItemDataSource _removeCartItemDataSource;
  RemoveCartItemRepositoryImp(this._removeCartItemDataSource);

  @override
  Future<void> call(String userId, String cartItemId) async {
    return await _removeCartItemDataSource(userId, cartItemId);
  }
}
