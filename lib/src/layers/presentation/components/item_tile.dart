import 'package:flutter/material.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/core/utils/formatters_service.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';

class ItemTile extends StatefulWidget {
  ItemTile({
    super.key,
    required this.item,
    required this.size,
  });

  final Item item;
  final FormatterService formatterService = FormatterService();
  double size;
  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 1,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(child: Image.asset(widget.item.imgUrl)),
                Text(
                  widget.item.itemName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: widget.size * .04,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      widget.formatterService
                          .priceToCurrency(widget.item.price)
                          .toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: widget.size * .05,
                        color: MaterialTheme.lightScheme().inversePrimary,
                      ),
                    ),
                    Text(
                      ' / ${widget.item.unit}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: widget.size * .028,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: Container(
            height: widget.size * .05,
            width: widget.size * .045,
            child: const Icon(
              Icons.add_shopping_cart_outlined,
            ),
          ),
        ),
      ],
    );
  }
}
