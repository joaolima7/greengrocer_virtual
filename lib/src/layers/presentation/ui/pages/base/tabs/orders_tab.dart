import 'package:flutter/material.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/app_data.dart'
    as appData;
import 'package:greengrocer_virtual/src/layers/presentation/ui/components/order_tile.dart';

class OrdersTab extends StatefulWidget {
  const OrdersTab({super.key});

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {
  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meus Pedidos',
          style:
              TextStyle(fontSize: sizeScreen.width * .065, color: Colors.white),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(15),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: appData.orders.length,
        itemBuilder: (context, index) {
          return OrderTile(
            order: appData.orders[index],
            sizeWidth: sizeScreen.width,
          );
        },
      ),
    );
  }
}
