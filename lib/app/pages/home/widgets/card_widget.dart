import 'package:flutter/material.dart';
import 'package:pjorclt/app/shared/style/colors.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final Function onTap;
  final bool checked;

  CardWidget({this.title, this.checked, this.onTap});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.infoLight,
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
