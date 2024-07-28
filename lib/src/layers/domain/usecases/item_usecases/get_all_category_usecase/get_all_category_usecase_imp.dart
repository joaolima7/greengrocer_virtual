import 'package:greengrocer_virtual/src/layers/domain/entities/category.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/item_repositories/get_all_category_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_all_category_usecase/get_all_category_usecase.dart';

class GetAllCategoryUseCaseImp implements GetAllCategoryUseCase {
  GetAllCategoryRepository _getAllCategoryRepository;
  GetAllCategoryUseCaseImp(this._getAllCategoryRepository);

  @override
  Future<List<Category>?> call() async {
    return await _getAllCategoryRepository();
  }
}
