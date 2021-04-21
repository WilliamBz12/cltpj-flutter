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
