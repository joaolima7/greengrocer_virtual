import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/item_repositories/get_items_by_search_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_items_by_search_usecase/get_items_by_search_usecase.dart';

class GetItemsBySearchUseCaseImp implements GetItemsBySearchUseCase {
  GetItemsBySearchRepository _getItemsBySearchRepository;
  GetItemsBySearchUseCaseImp(this._getItemsBySearchRepository);

  @override
  Future<List<Item>> call(String search) async {
    return await _getItemsBySearchRepository(search);
  }
}
