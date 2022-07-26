import 'package:flutter/material.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class AppFormTextField extends StatelessWidget {
  final String _label;

  const AppFormTextField({
    Key? key,
    required String label,
  })  : _label = label,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 14),
        filled: true,
        fillColor: AppColor.white,
        labelStyle: AppTextStyle.inputLabel,
        label: Text(_label),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.inputLabelColor,
            width: 3,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.inputLabelColor,
            width: 3,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
