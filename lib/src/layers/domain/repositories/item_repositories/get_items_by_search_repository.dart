import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';

abstract class GetItemsBySearchRepository {
  Future<List<Item>> call(String search);
}
