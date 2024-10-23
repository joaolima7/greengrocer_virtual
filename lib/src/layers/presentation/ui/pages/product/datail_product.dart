import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/core/utils/formatters_service.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/tabs/cart_tab_controller.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/components/quantity_custom.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
  final CartTabController _cartTabController = GetIt.I.get<CartTabController>();
  int carItemQuantity = 1;

  @override
  void initState() {
    super.initState();
    _cartTabController.checkItemInCart(widget.item.id!);
  }

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
                            tag: widget.item.imgUrl!,
                            child: Image.network(widget.item.imgUrl!),
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
                              Expanded(
                                flex: 2,
                                child: AutoSizeText(
                                  widget.item.itemName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  minFontSize: 25,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  widget.formatterService
                                      .priceToCurrency(widget.item.price)
                                      .toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: sizeScreen.width * .065,
                                    color: MaterialTheme.lightScheme()
                                        .inversePrimary,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
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
                          Obx(() {
                            if (_cartTabController.isLoading.value) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ElevatedButton(
                                onPressed: _cartTabController.isItemInCart.value
                                    ? null
                                    : () {
                                        _cartTabController.addCartItem(CartItem(
                                            objectId: '',
                                            item: widget.item,
                                            quantity: 1));
                                        _cartTabController
                                            .checkItemInCart(widget.item.id!);
                                      },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Icon(
                                        _cartTabController.isItemInCart.value
                                            ? Icons.check
                                            : Icons.add_shopping_cart_outlined,
                                      ),
                                    ),
                                    Text(
                                      _cartTabController.isItemInCart.value
                                          ? 'No Carrinho'
                                          : 'Add ao Carrinho',
                                      style: TextStyle(
                                        fontSize: sizeScreen.width * .038,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }),
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
            ),
          ),
        ],
      ),
    );
  }
}
