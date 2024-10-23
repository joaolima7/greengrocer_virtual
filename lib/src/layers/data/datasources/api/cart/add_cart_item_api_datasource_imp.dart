import 'package:greengrocer_virtual/src/core/utils/consts/endpoints.dart';
import 'package:greengrocer_virtual/src/core/utils/http_manager.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/cart_datasources/add_cart_item_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';

class AddCartItemApiDataSourceImp implements AddCartItemDataSource {
  final _httpManager = HttpManager();

  @override
  Future<CartItem> call(CartItem cartItem, String userId) async {
    try {
      var response = await _httpManager.restRequest(
        url: Endpoints.addCartItem,
        method: HttpMethods.post,
        body: {
          'userId': userId,
          'itemId': cartItem.item.id,
          'quantity': cartItem.quantity,
        },
      );

      if (response['result'] != null) {
        return CartItem.fromMap(response['result']);
      } else {
        return throw Exception('Erro ao adicionar item ao Carrinho!');
      }
    } catch (e) {
      return throw Exception('Erro na comunicação! ${e.toString()}');
    }
  }
}
