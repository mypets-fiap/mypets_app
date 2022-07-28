import 'package:flutter/material.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class AppButton extends StatelessWidget {
  final String _label;
  final EdgeInsetsGeometry _padding;
  final Function()? _onPressed;

  const AppButton({
    Key? key,
    required String label,
    EdgeInsetsGeometry padding = const EdgeInsets.all(0),
    required Function()? onPressed,
  })  : _label = label,
        _padding = padding,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: SizedBox(
        width: double.infinity,
        height: 44,
        child: ElevatedButton(
          onPressed: _onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColor.defaultColor,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
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
