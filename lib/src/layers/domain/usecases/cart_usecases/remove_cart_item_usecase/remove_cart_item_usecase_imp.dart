import 'package:greengrocer_virtual/src/layers/domain/repositories/cart_repositories/remove_cart_item_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/remove_cart_item_usecase/remove_cart_item_usecase.dart';

class RemoveCartItemUseCaseImp implements RemoveCartItemUseCase {
  RemoveCartItemRepository _removeCartItemRepository;
  RemoveCartItemUseCaseImp(this._removeCartItemRepository);

  @override
  Future<void> call(String userId, String cartItemId) async {
    return await _removeCartItemRepository(userId, cartItemId);
  }
}
