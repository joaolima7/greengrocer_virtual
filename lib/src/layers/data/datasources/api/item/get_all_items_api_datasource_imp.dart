import 'package:greengrocer_virtual/src/core/utils/consts/endpoints.dart';
import 'package:greengrocer_virtual/src/core/utils/http_manager.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/item_datasources/get_all_items_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';

class GetAllItemsApiDataSourceImp implements GetAllItemsDataSource {
  final _httpManager = HttpManager();

  @override
  Future<List<Item>?> call() async {
    try {
      var response = await _httpManager.restRequest(
        url: Endpoints.getAllItems,
        method: HttpMethods.post,
      );

      if (response['result'] != null) {
        List<dynamic> resultData = response['result'];
        return resultData.map((item) => Item.fromMap(item)).toList();
      } else {
        throw Exception('Erro ao carregar Itens!');
      }
    } catch (e) {
      throw Exception('Erro na comunicação itens! ${e.toString()}');
    }
  }
}
