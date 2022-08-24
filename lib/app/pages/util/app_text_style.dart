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

  static const headerHome = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColor.defaultColor,
  );

  static const section = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColor.defaultColor,
  );

  static const petName = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    color: AppColor.defaultColor,
  );

  static const headerTable = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColor.headerTableColor,
  );

  static const dataTable = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15,
    color: AppColor.headerTableColor,
  );
}
