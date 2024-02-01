import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constants.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight? get instance {
    _instance ??= TextThemeLight._init();
    return _instance;
  }

  TextThemeLight._init();

  TextStyle get primary => TextStyle(
        fontWeight: FontWeight.w700,
        color: ColorConstants.instance.textColor,
        fontSize: 16.sp,
      );
  TextStyle get secondary => TextStyle(
        fontWeight: FontWeight.w300,
        color: ColorConstants.instance.secondaryTextColor,
        fontSize: 14.sp,
      );
}
