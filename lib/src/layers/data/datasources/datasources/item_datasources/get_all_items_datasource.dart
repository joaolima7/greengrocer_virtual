import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';

abstract class GetAllItemsDataSource {
  Future<List<Item>?> call();
}
