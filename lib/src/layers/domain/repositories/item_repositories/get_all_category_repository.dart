import 'package:greengrocer_virtual/src/layers/domain/entities/category.dart';

abstract class GetAllCategoryRepository {
  Future<List<Category>?> call();
}
