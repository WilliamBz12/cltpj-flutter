import 'package:flutter/material.dart';
import 'package:pjorclt/app/shared/utils/screen_size.dart';

class CardResponsibleWidget extends StatelessWidget {
  CardResponsibleWidget({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenSize = currentScreenSize(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        width: screenSize == ScreenSize.medium ? double.maxFinite : 500,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: child,
      ),
    );
  }
}
