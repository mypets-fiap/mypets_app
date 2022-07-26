import 'package:flutter/cupertino.dart';
import 'package:mypets/app/pages/util/app_color.dart';

class AppTextStyle {
  static const _fontFamily = 'Montserrat';

  static const inputLabel = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColor.inputLabelColor,
  );

  static const appName = TextStyle(
    color: AppColor.defaultColor,
    fontSize: 48,
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
  );

  static const buttonText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );

  static textButton(Color color) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }
}
