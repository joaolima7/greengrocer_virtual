import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/core/utils/formatters_service.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/quantity_custom.dart';

class CartTile extends StatefulWidget {
  final CartItem cartItem;
  final FormatterService _formatterService = FormatterService();
  final Function(CartItem) remove;
  final Function() onQuantityChanged;
  double sizeScreen;

  CartTile({
    super.key,
    required this.cartItem,
    required this.sizeScreen,
    required this.remove,
    required this.onQuantityChanged,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(widget.cartItem.item.imgUrl),
        title: Text(
          widget.cartItem.item.itemName,
          style: TextStyle(
            fontSize: widget.sizeScreen * .04,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          widget._formatterService
              .priceToCurrency(widget.cartItem.totalPrice())
              .toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: widget.sizeScreen * .04,
            color: MaterialTheme.lightScheme().inversePrimary,
          ),
        ),
        trailing: QuantityCustom(
          sizeScreen: widget.sizeScreen,
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (quantity) {
            setState(() {
              if (quantity == 0) {
                widget.remove(widget.cartItem);
              } else {
                widget.cartItem.quantity = quantity;
              }
            });
            widget.onQuantityChanged();
          },
        ),
      ),
    );
  }
}
