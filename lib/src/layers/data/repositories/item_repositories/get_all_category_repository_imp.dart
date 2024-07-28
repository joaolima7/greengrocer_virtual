import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/item_datasources/get_all_category_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/category.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/item_repositories/get_all_category_repository.dart';

class GetAllCategoryRepositoryImp implements GetAllCategoryRepository {
  GetAllCategoryDataSource _getAllCategoryDataSource;
  GetAllCategoryRepositoryImp(this._getAllCategoryDataSource);

  @override
  Future<List<Category>?> call() async {
    return await _getAllCategoryDataSource();
  }
}
