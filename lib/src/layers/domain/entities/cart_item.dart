import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';

class CartItem {
  Item item;
  int quantity;

  CartItem({
    required this.item,
    required this.quantity,
  });

  double totalPrice() => item.price * quantity;
}
