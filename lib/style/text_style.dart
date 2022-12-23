import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTextStyles {
  /// - weight: w200
  /// - family: cairo
  static const TextStyle boldnames =
      TextStyle(fontWeight: FontWeight.bold, color: AppColor.primarytext,fontSize: 20);

  /// - weight: w300
  /// - family: cairo
  static const TextStyle w300 = TextStyle(fontWeight: FontWeight.w300,fontSize: 15);
  static const TextStyle greytxt = TextStyle(color: AppColor.nonactive);

  /// - weight: w400
  /// - family: cairo
  static const TextStyle w400 = TextStyle(fontWeight: FontWeight.w400);

  /// - weight: w500
  /// - family: cairo
  static const TextStyle w500 = TextStyle(fontWeight: FontWeight.w500);

  /// - weight: w600
  /// - family: cairo
  static const TextStyle w600 = TextStyle(fontWeight: FontWeight.w600);

  /// - weight: w700
  /// - family: cairo
  static const TextStyle w700 = TextStyle(fontWeight: FontWeight.w400,fontSize: 25);

  /// - weight: w800
  /// - family: cairo
  static const TextStyle w800 = TextStyle(fontWeight: FontWeight.w800);

  /// - weight: w900
  /// - family: cairo
  static const TextStyle w900 = TextStyle(fontWeight: FontWeight.w900);

  static const TextStyle largefont =
      TextStyle(fontWeight: FontWeight.w800, fontSize: 25);
}
