import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/item_repositories/get_items_by_category_rpeository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_items_by_category_usecase/get_items_by_category_usecase.dart';

class GetItemsByCategoryUseCaseImp implements GetItemsByCategoryUseCase {
  GetItemsByCategoryRepository _getItemsByCategoryRepository;
  GetItemsByCategoryUseCaseImp(this._getItemsByCategoryRepository);

  @override
  Future<List<Item>> call(String categoryId) async {
    return await _getItemsByCategoryRepository(categoryId);
  }
}
