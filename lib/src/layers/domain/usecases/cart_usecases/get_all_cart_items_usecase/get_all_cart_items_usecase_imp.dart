import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/cart_repositories/get_all_cart_items_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/get_all_cart_items_usecase/get_all_cart_items_usecase.dart';

class GetAllCartItemsUseCaseImp implements GetAllCartItemsUseCase {
  GetAllCartItemsRepository _getAllCartItemsRepository;
  GetAllCartItemsUseCaseImp(this._getAllCartItemsRepository);

  @override
  Future<List<CartItem>> call(String userId) async {
    return await _getAllCartItemsRepository(userId);
  }
}
