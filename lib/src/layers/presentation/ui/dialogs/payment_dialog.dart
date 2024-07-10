import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/core/utils/formatters_service.dart';
import 'package:greengrocer_virtual/src/core/utils/utils_dialogs.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/order.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {
  double sizeWidth;
  final Order order;
  final FormatterService _formatterService = FormatterService();
  final UtilsDialogs _utilsDialogs = UtilsDialogs();
  final String _pixCode = 'dsjhjshjkdhskhdskjdhsjkhdjk';

  PaymentDialog({
    super.key,
    required this.sizeWidth,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(sizeWidth * .1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pagamento com PIX',
                style: TextStyle(
                  fontSize: sizeWidth * .04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              QrImageView(
                data: _pixCode,
                version: QrVersions.auto,
                size: sizeWidth * .6,
              ),
              Text(
                'Vencimento: ${_formatterService.dateTimeFormatter(order.overdueDateTime)}',
                style: TextStyle(
                  fontSize: sizeWidth * .035,
                ),
              ),
              Text(
                'Total: ${_formatterService.priceToCurrency(order.total)}',
                style: TextStyle(
                  fontSize: sizeWidth * .035,
                  fontWeight: FontWeight.bold,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: _pixCode));
                  _utilsDialogs.showToast(
                      message: 'Código Pix Copiado!', sizeWidth: sizeWidth);
                },
                icon: Icon(
                  Icons.copy,
                  size: sizeWidth * .05,
                ),
                label: Text(
                  'Copiar código Pix',
                  style: TextStyle(
                    fontSize: sizeWidth * .035,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 5,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close),
          ),
        ),
      ],
    ));
  }
}
