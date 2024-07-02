import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';

class OrderStatus extends StatelessWidget {
  final String status;
  final bool isOverdue;
  final double sizeWidth;

  final Map<String, int> allStatus = {
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatus({
    super.key,
    required this.isOverdue,
    required this.status,
    required this.sizeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusDot(
          isActive: true,
          sizeWidth: sizeWidth,
          title: 'Pedido Confirmado',
        ),
        _CustomDivider(sizeWidth: sizeWidth),
        if (currentStatus == 1) ...[
          _StatusDot(
            isActive: true,
            sizeWidth: sizeWidth,
            title: 'Pix estornado',
            color: Colors.orange,
          )
        ] else if (isOverdue) ...[
          _StatusDot(
            isActive: true,
            sizeWidth: sizeWidth,
            title: 'Pagamento Pix vencido',
            color: Colors.red,
          )
        ] else ...[
          _StatusDot(
            isActive: currentStatus >= 2,
            sizeWidth: sizeWidth,
            title: 'Pagamento efetuado',
          ),
          _CustomDivider(sizeWidth: sizeWidth),
          _StatusDot(
            isActive: currentStatus >= 3,
            sizeWidth: sizeWidth,
            title: 'Preparando',
          ),
          _CustomDivider(sizeWidth: sizeWidth),
          _StatusDot(
            isActive: currentStatus >= 4,
            sizeWidth: sizeWidth,
            title: 'Enviado',
          ),
          _CustomDivider(sizeWidth: sizeWidth),
          _StatusDot(
            isActive: currentStatus == 5,
            sizeWidth: sizeWidth,
            title: 'Entregue!',
          )
        ]
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  double sizeWidth;

  _CustomDivider({
    super.key,
    required this.sizeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      height: sizeWidth * .03,
      width: 2,
      color: Colors.grey.shade400,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? color;
  double sizeWidth;

  _StatusDot({
    super.key,
    this.color,
    required this.isActive,
    required this.sizeWidth,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: Container(
            alignment: Alignment.center,
            width: sizeWidth * .05,
            height: sizeWidth * .05,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: MaterialTheme.lightScheme().primary),
                color: isActive
                    ? color ?? MaterialTheme.lightScheme().inversePrimary
                    : Colors.transparent),
            child: isActive
                ? Icon(
                    Icons.check_rounded,
                    size: sizeWidth * .04,
                  )
                : const SizedBox.shrink(),
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: sizeWidth * .032),
          ),
        ),
      ],
    );
  }
}
