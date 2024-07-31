import 'package:greengrocer_virtual/src/core/utils/consts/endpoints.dart';
import 'package:greengrocer_virtual/src/core/utils/http_manager.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/item_datasources/get_items_by_category_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';

class GetItemsByCategoryApiDataSourceImp
    implements GetItemsByCategoryDataSource {
  final _httpManager = HttpManager();

  @override
  Future<List<Item>> call(String categoryId) async {
    try {
      var response = await _httpManager.restRequest(
        url: Endpoints.getItemsByCategory,
        method: HttpMethods.post,
        body: {"categoryId": categoryId},
      );

      if (response['result'] != null) {
        List<dynamic> list = response['result'];
        return list.map((item) => Item.fromMap(item)).toList();
      } else {
        throw Exception('Erro ao carregar Itens!');
      }
    } catch (e) {
      throw Exception('Erro na comunicação itens! ${e.toString()}');
    }
  }
}
