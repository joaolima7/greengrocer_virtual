import 'package:greengrocer_virtual/src/core/utils/consts/endpoints.dart';
import 'package:greengrocer_virtual/src/core/utils/http_manager.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/item_datasources/get_all_category_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/category.dart';

class GetAllCategoryApiDataSourceImp implements GetAllCategoryDataSource {
  final _httpManager = HttpManager();

  @override
  Future<List<Category>?> call() async {
    try {
      var response = await _httpManager.restRequest(
        url: Endpoints.getAllCategories,
        method: HttpMethods.post,
      );

      if (response['result'] != null) {
        List<dynamic> resultData = response['result'];
        return resultData
            .map((category) => Category.fromMap(category))
            .toList();
      } else {
        return throw Exception('Erro ao carregar Categorias!');
      }
    } catch (e) {
      return throw Exception(
          'Erro na comunicação com o servidor! ${e.toString()}');
    }
  }
}
