import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class AppFormDateField extends StatefulWidget {
  final TextEditingController _controller;
  final String _label;

  const AppFormDateField({
    Key? key,
    required TextEditingController controller,
    required String label,
  })  : _controller = controller,
        _label = label,
        super(key: key);
  @override
  State<AppFormDateField> createState() => _AppFormDateFieldState();
}

class _AppFormDateFieldState extends State<AppFormDateField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        readOnly: true,
        onTap: () async {
          var date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1910),
            lastDate: DateTime.now(),
            initialEntryMode: DatePickerEntryMode.input,
          );
          if (date != null) {
            widget._controller.text = DateFormat("dd/MM/yyyy").format(date);
          }
        },
        validator: (value) {
          if (value == null) {
            return "${widget._label} é obrigatório";
          }
          return null;
        },
        controller: widget._controller,
        decoration: InputDecoration(
          labelText: widget._label,
          labelStyle: AppTextStyle.inputLabel,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: const Icon(
            Icons.date_range,
            color: AppColor.inputLabelColor,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.inputLabelColor,
              width: 3,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.inputLabelColor,
              width: 3,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
