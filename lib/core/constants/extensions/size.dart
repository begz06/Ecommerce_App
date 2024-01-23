import 'package:flutter/widgets.dart';

extension Sizes on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get heigth => MediaQuery.sizeOf(this).height;
}
