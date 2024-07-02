import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/core/utils/formatters_service.dart';
import 'package:greengrocer_virtual/src/core/app_data/app_data.dart' as appData;
import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/cart_tile.dart';
import 'package:greengrocer_virtual/src/layers/presentation/dialogs/payment_dialog.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final FormatterService _formatterService = FormatterService();
  double total = 0;

  void removeItemFromCart(CartItem cartItem) {
    setState(() {
      appData.cartItems.remove(cartItem);
    });
  }

  void cartTotalPrice() {
    double result = 0;

    for (var item in appData.cartItems) {
      result += item.totalPrice();
    }

    setState(() {
      total = result;
    });
  }

  @override
  void initState() {
    super.initState();
    cartTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meu Carrinho',
          style:
              TextStyle(fontSize: sizeScreen.width * .065, color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 10,
              ),
              child: appData.cartItems.isEmpty
                  ? const Center(
                      child: Text('Carrinho Vazio!'),
                    )
                  : ListView.builder(
                      itemCount: appData.cartItems.length,
                      itemBuilder: (_, index) {
                        return CartTile(
                          cartItem: appData.cartItems[index],
                          sizeScreen: sizeScreen.width,
                          remove: removeItemFromCart,
                          onQuantityChanged: cartTotalPrice,
                        );
                      },
                    ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white24,
                    blurRadius: 3,
                    spreadRadius: 2,
                  ),
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: sizeScreen.width * .05,
                  horizontal: sizeScreen.width * .05),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Total geral',
                    style: TextStyle(
                        fontSize: sizeScreen.width * .035, color: Colors.black),
                  ),
                  Text(
                    _formatterService.priceToCurrency(total).toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: sizeScreen.width * .065,
                      color: MaterialTheme.lightScheme().inversePrimary,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();

                      if (result == true)
                        showDialog(
                            context: context,
                            builder: (_) {
                              return PaymentDialog(
                                sizeWidth: sizeScreen.width,
                                order: appData.orders.first,
                              );
                            });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(Icons.check_circle_rounded),
                        ),
                        Text(
                          'Concluir Pedido',
                          style: TextStyle(fontSize: sizeScreen.width * .038),
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
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: const Text('Deseja realmente concluir o pedido?'),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Não'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
