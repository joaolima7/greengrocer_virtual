import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/cart_repositories/update_cart_item_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/update_cart_item_usecase/update_cart_item_usecase.dart';

class UpdateCartItemUseCaseImp implements UpdateCartItemUseCase {
  UpdateCartItemRepository _updateCartItemRepository;
  UpdateCartItemUseCaseImp(this._updateCartItemRepository);

  @override
  Future<CartItem> call(String userId, CartItem cartItem) async {
    return await _updateCartItemRepository(userId, cartItem);
  }
}
