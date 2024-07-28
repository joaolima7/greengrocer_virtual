import 'package:greengrocer_virtual/src/layers/domain/entities/category.dart';

abstract class GetAllCategoryDataSource {
  Future<List<Category>?> call();
}
