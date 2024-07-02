import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';

class Order {
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  List<CartItem> items;
  String status;
  String copyAndPaste;
  double total;

  Order({
    required this.id,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    this.total = 0.0,
  }) {
    calculateTotal();
  }

  void calculateTotal() {
    total = items.fold(0, (sum, item) => sum + item.totalPrice());
  }
}
