import 'package:flutter/material.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class AppButton extends StatelessWidget {
  final String _label;
  final EdgeInsetsGeometry _padding;

  const AppButton({
    Key? key,
    required String label,
    EdgeInsetsGeometry padding = const EdgeInsets.all(0),
  })  : _label = label,
        _padding = padding,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: SizedBox(
        width: double.infinity,
        height: 44,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: AppColor.defaultColor,
          ),
          child: Text(
            _label,
            style: AppTextStyle.buttonText,
          ),
        ),
      ),
    );
  }
}
