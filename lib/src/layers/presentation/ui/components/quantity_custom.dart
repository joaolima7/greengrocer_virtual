import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';

class QuantityCustom extends StatefulWidget {
  QuantityCustom({
    super.key,
    required this.sizeScreen,
    required this.suffixText,
    required this.value,
    required this.result,
  });

  double sizeScreen;
  final int value;
  final String suffixText;
  final Function(int quantity) result;

  @override
  State<QuantityCustom> createState() => _QuantityCustomState();
}

class _QuantityCustomState extends State<QuantityCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _QuantityButton(
            sizeScreen: widget.sizeScreen,
            color: widget.value == 1 ? Colors.red : Colors.grey,
            icon:
                widget.value == 1 ? Icons.delete_forever_rounded : Icons.remove,
            onPressed: () {
              if (widget.value == 1) {}
              int resultCount = widget.value - 1;
              widget.result(resultCount);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '${widget.value} ${widget.suffixText}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: widget.sizeScreen * .045,
              ),
            ),
          ),
          _QuantityButton(
            sizeScreen: widget.sizeScreen,
            color: MaterialTheme.lightScheme().primary,
            icon: Icons.add,
            onPressed: () {
              int resultCount = widget.value + 1;
              widget.result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  _QuantityButton({
    super.key,
    required this.sizeScreen,
    required this.color,
    required this.icon,
    required this.onPressed,
  });

  final Color color;
  final IconData icon;
  final VoidCallback onPressed;
  double sizeScreen;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          width: sizeScreen * .06,
          height: sizeScreen * .06,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: sizeScreen * .04,
          ),
        ),
      ),
    );
  }
}
