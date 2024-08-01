import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/cart_datasources/add_cart_item_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/cart_repositories/add_cart_item_respository.dart';

class AddCartItemRepositoryImp implements AddCartItemRepository {
  AddCartItemDataSource _addCartItemDataSource;
  AddCartItemRepositoryImp(this._addCartItemDataSource);

  @override
  Future<CartItem> call(CartItem cartItem, String userId) async {
    return await _addCartItemDataSource(cartItem, userId);
  }
}
