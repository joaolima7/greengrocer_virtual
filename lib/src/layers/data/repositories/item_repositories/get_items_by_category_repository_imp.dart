import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/item_datasources/get_items_by_category_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/item_repositories/get_items_by_category_rpeository.dart';

class GetItemsByCategoryRespositoryImp implements GetItemsByCategoryRepository {
  GetItemsByCategoryDataSource _getItemsByCategoryDataSource;
  GetItemsByCategoryRespositoryImp(this._getItemsByCategoryDataSource);

  @override
  Future<List<Item>> call(String categoryId) async {
    return await _getItemsByCategoryDataSource(categoryId);
  }
}
