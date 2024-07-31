import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';

abstract class GetItemsByCategoryDataSource {
  Future<List<Item>> call(String categoryId);
}
