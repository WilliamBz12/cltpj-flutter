import 'package:flutter/material.dart';

enum ScreenSize {
  small,
  medium,
  large,
}

ScreenSize currentScreenSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  if (width <= 400) {
    return ScreenSize.small;
  }

  if (width > 400 && width < 700) {
    return ScreenSize.medium;
  }

  return ScreenSize.large;
}

class CardResponsibleWidget extends StatelessWidget {
  CardResponsibleWidget({@required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenSize = currentScreenSize(context);
    return Container(
      margin: const EdgeInsets.all(20.0),
      width: screenSize == ScreenSize.small ? double.maxFinite : 400,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: child,
    );
  }
}
