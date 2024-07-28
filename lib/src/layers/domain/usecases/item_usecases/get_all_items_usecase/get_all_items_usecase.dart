import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';

abstract class GetAllItemsUseCase {
  Future<List<Item>?> call();
}
