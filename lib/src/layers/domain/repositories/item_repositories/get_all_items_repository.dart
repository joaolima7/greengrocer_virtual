import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';

abstract class GetAllItemsRepository {
  Future<List<Item>?> call();
}
