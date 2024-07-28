import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/item_repositories/get_all_items_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_all_items_usecase/get_all_items_usecase.dart';

class GetAllItemsUseCaseImp implements GetAllItemsUseCase {
  GetAllItemsRepository _getAllItemsRepository;
  GetAllItemsUseCaseImp(this._getAllItemsRepository);

  @override
  Future<List<Item>?> call() async {
    return await _getAllItemsRepository();
  }
}
