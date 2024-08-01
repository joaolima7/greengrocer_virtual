import 'package:greengrocer_virtual/src/core/utils/consts/endpoints.dart';
import 'package:greengrocer_virtual/src/core/utils/http_manager.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/cart_datasources/update_cart_item_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';

class UpdateCartItemApiDataSourceImp implements UpdateCartItemDataSource {
  final _httpManager = HttpManager();

  @override
  Future<CartItem> call(String userId, CartItem cartItem) async {
    try {
      var response = await _httpManager.restRequest(
        url: Endpoints.updateCartItem,
        method: HttpMethods.post,
        body: {
          'userId': userId,
          'cartItemId': cartItem.objectId,
          'quantity': cartItem.quantity,
        },
      );

      if (response['result'] != null) {
        return CartItem.fromJson(response['result']);
      } else {
        return throw Exception('Erro ao atualizar Carrinho!');
      }
    } catch (e) {
      return throw Exception('Erro na comunicação! ${e.toString()}');
    }
  }
}
