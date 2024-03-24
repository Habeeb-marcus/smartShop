import 'package:flutter/material.dart';

class Spacing {
  static double get spacingXXS => 2;
  static double get spacingXS => 4;
  static double get spacingS => 8;
  static double get spacingM => 16;
  static double get spacingN => 20;
  static double get spacingL => 32;
  static double get spacingXL => 64;
  static double get spacingXXL => 128;
  static double get spacingXXXL => 256;
  static Size screenSize(BuildContext context) => MediaQuery.of(context).size;
}

class VSpace {
  static final Widget veryTiny = SizedBox(height: Spacing.spacingXXS);
  static final Widget tiny = SizedBox(height: Spacing.spacingXS);
  static final Widget small = SizedBox(height: Spacing.spacingS);
  static final Widget medium = SizedBox(height: Spacing.spacingM);
  static final Widget large = SizedBox(height: Spacing.spacingL);
  static final Widget xLarge = SizedBox(height: Spacing.spacingXL);
  static final Widget massive = SizedBox(height: Spacing.spacingXXL);
}

class HSpace {
  static final Widget veryTiny = SizedBox(width: Spacing.spacingXXS);
  static final Widget tiny = SizedBox(width: Spacing.spacingXS);
  static final Widget small = SizedBox(width: Spacing.spacingS);
  static final Widget medium = SizedBox(width: Spacing.spacingM);
  static final Widget large = SizedBox(width: Spacing.spacingL);
  static final Widget xLarge = SizedBox(width: Spacing.spacingXL);
  static final Widget massive = SizedBox(width: Spacing.spacingXXL);
}
