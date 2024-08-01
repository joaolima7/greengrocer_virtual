import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/cart_datasources/get_all_cart_items_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/cart_repositories/get_all_cart_items_repository.dart';

class GetAllCartItemsRepositoryImp implements GetAllCartItemsRepository {
  GetAllCartItemsDataSource _allCartItemsDataSource;
  GetAllCartItemsRepositoryImp(this._allCartItemsDataSource);

  @override
  Future<List<CartItem>> call(String userId) async {
    return await _allCartItemsDataSource(userId);
  }
}
