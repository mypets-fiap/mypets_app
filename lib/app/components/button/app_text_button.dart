import 'package:flutter/material.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class AppTextButton extends StatelessWidget {
  final String _label;
  final Color _fontColor;

  const AppTextButton({
    Key? key,
    required String label,
    Color fontColor = AppColor.defaultColor,
  })  : _label = label,
        _fontColor = fontColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        _label,
        style: AppTextStyle.textButton(_fontColor),
      ),
    );
  }
}
