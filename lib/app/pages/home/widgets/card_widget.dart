import 'package:flutter/material.dart';
import 'package:pjorclt/app/shared/style/colors.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final Function onTap;
  final Function? clear;
  final bool checked;

  CardWidget({
    required this.title,
    required this.onTap,
    this.checked = false,
    this.clear,
  });

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.checked ? AppColors.success : AppColors.infoLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: InkWell(
        onTap: () => widget.onTap(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.checked ? Colors.white : Colors.black,
                ),
              ),
              if (widget.checked)
                Icon(
                  Icons.check,
                  color: Colors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
