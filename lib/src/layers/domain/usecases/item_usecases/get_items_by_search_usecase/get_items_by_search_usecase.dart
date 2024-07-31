import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';

abstract class GetItemsBySearchUseCase {
  Future<List<Item>> call(String search);
}
