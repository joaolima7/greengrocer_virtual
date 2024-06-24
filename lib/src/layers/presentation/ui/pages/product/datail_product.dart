import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/core/utils/formatters_service.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/quantity_custom.dart';

class DetailProduct extends StatefulWidget {
  DetailProduct({
    super.key,
    required this.item,
  });

  final Item item;
  final FormatterService formatterService = FormatterService();

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  int carItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: sizeScreen.width,
              height: sizeScreen.height,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: SafeArea(
                      child: Container(
                        child: Center(
                          child: Hero(
                            tag: widget.item.imgUrl,
                            child: Image.asset(widget.item.imgUrl),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: sizeScreen.width * .07,
                        vertical: sizeScreen.width * .06,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40)),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    widget.item.itemName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: sizeScreen.width * .085,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    widget.formatterService
                                        .priceToCurrency(widget.item.price)
                                        .toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: sizeScreen.width * .065,
                                      color: MaterialTheme.lightScheme()
                                          .inversePrimary,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      QuantityCustom(
                                        suffixText: widget.item.unit,
                                        value: carItemQuantity,
                                        sizeScreen: sizeScreen.width,
                                        result: (quantity) {
                                          setState(() {
                                            carItemQuantity = quantity;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Expanded(child: Divider()),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6, bottom: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: sizeScreen.width * .05,
                                  ),
                                ),
                                Text(
                                  widget.formatterService
                                      .priceToCurrency(
                                          widget.item.price * carItemQuantity)
                                      .toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: sizeScreen.width * .065,
                                    color: MaterialTheme.lightScheme()
                                        .inversePrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(Icons.add_shopping_cart_outlined),
                                ),
                                Text(
                                  'Add ao Carrinho',
                                  style: TextStyle(
                                      fontSize: sizeScreen.width * .038),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 10,
              left: 10,
              child: SafeArea(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              )),
        ],
      ),
    );
  }
}
