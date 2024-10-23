import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/core/utils/formatters_service.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/tabs/cart_tab_controller.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/components/cart_tile.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/dialogs/payment_dialog.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/app_data.dart'
    as appData;

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final FormatterService _formatterService = FormatterService();
  final CartTabController _cartTabController = GetIt.I.get<CartTabController>();

  @override
  void initState() {
    super.initState();
    _cartTabController.getCartItems();
  }

  void removeItemFromCart(CartItem cartItem) {
    _cartTabController.removeCartItem(cartItem);
  }

  double calculateTotalPrice() {
    double result = 0;
    for (var item in _cartTabController.allCartItems) {
      result += item.totalPrice();
    }
    return result;
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
      body: Obx(() {
        if (_cartTabController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 10,
                ),
                child: _cartTabController.allCartItems.isEmpty
                    ? const Center(
                        child: Text('Carrinho Vazio!'),
                      )
                    : ListView.builder(
                        itemCount: _cartTabController.allCartItems.length,
                        itemBuilder: (_, index) {
                          return CartTile(
                            cartItem: _cartTabController.allCartItems[index],
                            sizeScreen: sizeScreen.width,
                            remove: removeItemFromCart,
                            onQuantityChanged: () {
                              setState(() {});
                            },
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
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: sizeScreen.width * .05,
                  horizontal: sizeScreen.width * .05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Total geral',
                      style: TextStyle(
                        fontSize: sizeScreen.width * .035,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      _formatterService
                          .priceToCurrency(calculateTotalPrice())
                          .toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: sizeScreen.width * .065,
                        color: MaterialTheme.lightScheme().inversePrimary,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        bool? result = await showOrderConfirmation();
                        if (result == true) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              // Implementar a lógica para obter o pedido a partir do controlador
                              // final order = _cartTabController.order;
                              return PaymentDialog(
                                sizeWidth: sizeScreen.width,
                                order: appData.orders.first,
                              );
                            },
                          );
                        }
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
        );
      }),
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
