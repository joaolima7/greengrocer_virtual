import 'package:flutter/material.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({
    super.key,
    required this.category,
    required this.isSelected,
    required this.sizeScreen,
    required this.onPressed,
  });

  bool isSelected;
  String category;
  double sizeScreen;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected
                ? MaterialTheme.lightScheme().primary
                : Colors.transparent,
          ),
          child: Text(
            category,
            style: TextStyle(
              color:
                  isSelected ? Colors.white : MaterialTheme.lightScheme().error,
              fontWeight: FontWeight.bold,
              fontSize: isSelected ? sizeScreen * .05 : sizeScreen * .04,
            ),
          ),
        ),
      ),
    );
  }
}
