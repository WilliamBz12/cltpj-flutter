import 'package:flutter/material.dart';
import 'package:pjorclt/app/shared/utils/screen_size.dart';

class SizedAppBar extends StatelessWidget {
  final String title;

  SizedAppBar(this.title);
  @override
  Widget build(BuildContext context) {
    final screenSize = currentScreenSize(context);

    return Container(
      width: screenSize == ScreenSize.medium ? double.maxFinite : 600,
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20),
              Text(
                "$title",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
