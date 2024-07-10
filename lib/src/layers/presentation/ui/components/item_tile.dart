import 'package:flutter/material.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/core/utils/formatters_service.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/pages/product/datail_product.dart';

class ItemTile extends StatefulWidget {
  final Item item;
  final FormatterService formatterService = FormatterService();
  final double size;
  final void Function(GlobalKey, Item) addToCart;

  ItemTile({
    super.key,
    required this.item,
    required this.size,
    required this.addToCart,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  GlobalKey imageKey = GlobalKey();
  IconData tileIcon = Icons.add_shopping_cart_outlined;

  Future<void> switchIcon() async {
    if (mounted) {
      setState(() {
        tileIcon = Icons.check;
      });
      await Future.delayed(const Duration(milliseconds: 1500));
      if (mounted) {
        setState(() {
          tileIcon = Icons.add_shopping_cart_outlined;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailProduct(item: widget.item),
              ),
            );
          },
          child: Card(
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
                  Expanded(
                    child: Container(
                      key: imageKey,
                      child: Hero(
                        tag: widget.item.imgUrl,
                        child: Image.asset(widget.item.imgUrl),
                      ),
                    ),
                  ),
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
        ),
        Positioned(
          top: 5,
          right: 5,
          child: GestureDetector(
            onTap: () {
              widget.addToCart(imageKey, widget.item);
              switchIcon();
            },
            child: Container(
              decoration: BoxDecoration(
                color: MaterialTheme.lightScheme().primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(widget.size * .01),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Icon(
                    tileIcon,
                    key: ValueKey<IconData>(tileIcon),
                    color: Colors.white,
                    size: widget.size * .055,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
