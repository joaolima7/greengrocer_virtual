import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/item_datasources/get_items_by_search_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/item_repositories/get_items_by_search_repository.dart';

class GetItemsBySearchRepositoryImp implements GetItemsBySearchRepository {
  GetItemsBySearchDataSource _getItemsBySearchDataSource;
  GetItemsBySearchRepositoryImp(this._getItemsBySearchDataSource);

  @override
  Future<List<Item>> call(String search) async {
    return await _getItemsBySearchDataSource(search);
  }
}
