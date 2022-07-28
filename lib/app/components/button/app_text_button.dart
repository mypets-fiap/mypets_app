import 'package:flutter/material.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class AppTextButton extends StatelessWidget {
  final String _label;
  final Color _fontColor;
  final Function()? _onPressed;

  const AppTextButton({
    Key? key,
    required String label,
    required Function()? onPressed,
    Color fontColor = AppColor.defaultColor,
  })  : _label = label,
        _fontColor = fontColor,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onPressed,
      child: Text(
        _label,
        style: AppTextStyle.textButton(_fontColor),
      ),
    );
  }
}
