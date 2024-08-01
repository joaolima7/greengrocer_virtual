import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/cart_repositories/add_cart_item_respository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/add_cart_item_usecase/add_cart_item_usecase.dart';

class AddCartItemUseCaseImp implements AddCartItemUseCase {
  AddCartItemRepository _addCartItemRepository;
  AddCartItemUseCaseImp(this._addCartItemRepository);

  @override
  Future<CartItem> call(CartItem cartItem, String userId) async {
    return await _addCartItemRepository(cartItem, userId);
  }
}
