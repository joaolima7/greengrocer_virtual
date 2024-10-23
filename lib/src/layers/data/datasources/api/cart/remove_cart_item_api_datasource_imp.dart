import 'package:greengrocer_virtual/src/core/utils/http_manager.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/cart_datasources/remove_cart_item_datasource.dart';

import '../../../../../core/utils/consts/endpoints.dart';

class RemoveCartItemApiDataSourceImp implements RemoveCartItemDataSource {
  final _httpManager = HttpManager();
  @override
  Future<void> call(String userId, String cartItemId) async {
    try {
      var response = await _httpManager.restRequest(
        url: Endpoints.removeCartItem,
        method: HttpMethods.post,
        body: {
          'userId': userId,
          'cartItemId': cartItemId,
        },
      );
    } catch (e) {
      throw Exception('Erro na comunicação! ${e.toString()}');
    }
  }
}
