import 'package:greengrocer_virtual/src/layers/domain/entities/category.dart';

abstract class GetAllCategoryUseCase {
  Future<List<Category>?> call();
}
