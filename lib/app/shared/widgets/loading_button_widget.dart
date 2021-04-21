import 'package:flutter/material.dart';
import '../style/colors.dart';

class LoadingButtonWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isLoading;
  final Color color;
  final Color textColor;

  final double buttonWidth;

  LoadingButtonWidget({
    required this.text,
    required this.onTap,
    this.color = AppColors.white,
    this.isLoading = false,
    this.buttonWidth = double.infinity,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: 50,
      child: RaisedButton(
        disabledColor: isLoading ? color : Colors.grey[70],
        child: !isLoading
            ? Text(
                text,
                style: TextStyle(color: textColor),
              )
            : CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(textColor),
              ),
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 5,
        onPressed: !isLoading ? () => onTap() : null,
      ),
    );
  }
}
