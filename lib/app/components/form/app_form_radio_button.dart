import 'package:flutter/material.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class AppFormRadioListTile extends StatefulWidget {
  final TextEditingController _controller;
  final List<String> _listItem;
  final String _label;
  final bool _isRequired;

  const AppFormRadioListTile({
    Key? key,
    required TextEditingController controller,
    required String label,
    required List<String> listItem,
    bool isRequired = false,
  })  : _controller = controller,
        _label = label,
        _listItem = listItem,
        _isRequired = isRequired,
        super(key: key);

  @override
  State<AppFormRadioListTile> createState() => _AppFormRadioListTile();
}

class _AppFormRadioListTile extends State<AppFormRadioListTile> {
  String? text;

  @override
  Widget build(BuildContext context) {
    String label = super.widget._label;
    List<String> listItem = super.widget._listItem;
    TextEditingController controller = super.widget._controller;
    bool isRequired = super.widget._isRequired;

    return FormField(
      builder: (FormFieldState<bool> state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: !state.hasError ? AppColor.inputLabelColor : Colors.red,
                width: 3,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    label,
                    style: AppTextStyle.inputLabel,
                  ),
                ),
                Wrap(
                  runSpacing: 2,
                  spacing: 2,
                  children: getRadio(listItem, controller, state),
                ),
                state.hasError
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 8),
                        child: Text(
                          state.errorText!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
      validator: (value) {
        if (value != true && isRequired) {
          return "$label é obrigatório";
        } else {
          return null;
        }
      },
    );
  }

  List<Widget> getRadio(
      List<String> items, TextEditingController controller, state) {
    List<Widget> list = [];

    for (String item in items) {
      list.add(
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.3,
          child: ListTileTheme(
            horizontalTitleGap: 2,
            child: RadioListTile(
              activeColor: AppColor.defaultColor,
              groupValue: text,
              onChanged: (value) {
                setState(() {
                  state.setValue(true);
                  text = value.toString();
                  controller.text = value.toString();
                });
              },
              value: item,
              title: Text(
                item,
                style: AppTextStyle.inputLabel,
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }
}
