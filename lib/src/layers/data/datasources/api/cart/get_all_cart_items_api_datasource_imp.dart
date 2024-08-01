import 'package:greengrocer_virtual/src/core/utils/consts/endpoints.dart';
import 'package:greengrocer_virtual/src/core/utils/http_manager.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/cart_datasources/get_all_cart_items_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';

class GetAllCartItemsApiDataSource implements GetAllCartItemsDataSource {
  final _httpManager = HttpManager();

  @override
  Future<List<CartItem>> call(String userId) async {
    try {
      var response = await _httpManager.restRequest(
        url: Endpoints.getAllCartItems,
        method: HttpMethods.post,
        body: {'userId': userId},
      );

      if (response['result'] != null) {
        List<dynamic> list = response['result'];
        return list.map((item) => CartItem.fromJson(item)).toList();
      } else {
        return throw Exception('Erro ao carregar Carrinho!');
      }
    } catch (e) {
      return throw Exception('Erro na comunicação! ${e.toString()}');
    }
  }
}
