import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/item_datasources/get_all_items_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/item_repositories/get_all_items_repository.dart';

class GetAllItemsRepostitoryImp implements GetAllItemsRepository {
  GetAllItemsDataSource _getAllItemsDataSource;
  GetAllItemsRepostitoryImp(this._getAllItemsDataSource);

  @override
  Future<List<Item>?> call() async {
    return await _getAllItemsDataSource();
  }
}
