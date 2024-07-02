import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greengrocer_virtual/src/core/utils/formatters_service.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/order.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/order_status.dart';
import 'package:greengrocer_virtual/src/layers/presentation/dialogs/payment_dialog.dart';

class OrderTile extends StatelessWidget {
  OrderTile({
    super.key,
    required this.sizeWidth,
    required this.order,
  });

  final Order order;
  double sizeWidth;
  final FormatterService _formatterService = FormatterService();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Pedido: #${order.id}'),
              Text(
                _formatterService.dateTimeFormatter(order.createdDateTime),
                style: TextStyle(
                  fontSize: sizeWidth * .04,
                ),
              ),
            ],
          ),
          childrenPadding: EdgeInsets.fromLTRB(
            sizeWidth * .03,
            sizeWidth * .04,
            sizeWidth * .03,
            sizeWidth * .04,
          ),
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return _OrderItemWidget(
                            sizeWidth: sizeWidth,
                            formatterService: _formatterService,
                            orderItem: orderItem,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.shade400,
                    thickness: 2,
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: OrderStatus(
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                      status: order.status,
                      sizeWidth: sizeWidth,
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                  style: TextStyle(
                    fontSize: sizeWidth * .05,
                  ),
                  children: [
                    TextSpan(
                      text: 'Total ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: _formatterService.priceToCurrency(order.total),
                    ),
                  ]),
            ),
            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return PaymentDialog(
                          sizeWidth: sizeWidth,
                          order: order,
                        );
                      });
                },
                icon: const Icon(Icons.pix),
                label: Text(
                  'Pagar com PIX',
                  style: TextStyle(fontSize: sizeWidth * .035),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    super.key,
    required this.sizeWidth,
    required FormatterService formatterService,
    required this.orderItem,
  }) : _formatterService = formatterService;

  final double sizeWidth;
  final FormatterService _formatterService;
  final CartItem orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: sizeWidth * .038,
            ),
          ),
          Expanded(
              child: Text(
            ' ${orderItem.item.itemName}',
            style: TextStyle(
              fontSize: sizeWidth * .038,
            ),
          )),
          Text(
            _formatterService.priceToCurrency(orderItem.totalPrice()),
            style: TextStyle(
              fontSize: sizeWidth * .038,
            ),
          ),
        ],
      ),
    );
  }
}
