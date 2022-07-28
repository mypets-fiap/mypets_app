import 'package:flutter/material.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class AppFormTextField extends StatelessWidget {
  final String _label;
  final bool _isPassword;
  final TextEditingController _controller;
  final TextEditingController? _controllerValidateEquals;

  const AppFormTextField({
    Key? key,
    required String label,
    bool isPassword = false,
    required TextEditingController controller,
    TextEditingController? controllerValidateEquals,
  })  : _label = label,
        _isPassword = isPassword,
        _controller = controller,
        _controllerValidateEquals = controllerValidateEquals,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: _isPassword,
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
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 3,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 3,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorStyle: const TextStyle(fontSize: 0, height: -10),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Insira o $_label';
        }
        if (_controllerValidateEquals != null) {
          if (_controller.text != _controllerValidateEquals!.text) {
            return 'O valor precisa ser igual.';
          }
        }

        return null;
      },
    );
  }
}
