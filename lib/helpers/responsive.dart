import 'package:flutter/material.dart';

extension ResponsiveContextExtensions on BuildContext {
  // Returns screen size
  Size get mediaQuerySize => MediaQuery.of(this).size;
  // Returns screen height
  double get height => mediaQuerySize.height;
  // Returns screen width
  double get width => mediaQuerySize.width;
  // Returns screen padding
  EdgeInsets get padding => MediaQuery.of(this).padding;
  // Returns the height by percentage
  double hp(double percent) => mediaQuerySize.height * percent / 100;
  // Returns the width by percentage
  double wp(double percent) => mediaQuerySize.width * percent / 100;
}
