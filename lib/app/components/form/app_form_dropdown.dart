import 'package:flutter/material.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class AppFormDropdown extends StatelessWidget {
  final List<String> _items;
  final String _label;
  final TextEditingController _controller;

  const AppFormDropdown({
    Key? key,
    required String label,
    required List<String> items,
    required TextEditingController controller,
  })  : _label = label,
        _items = items,
        _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: DropdownButtonFormField(
        items: _items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (value) {
          _controller.text = value.toString();
        },
        validator: (value) {
          if (value == null) {
            return 'Insira o $_label';
          }
          return null;
        },
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
          //errorStyle: const TextStyle(fontSize: 0, height: -10),
        ),
      ),
    );
  }
}
