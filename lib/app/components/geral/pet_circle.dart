import 'package:flutter/material.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class PetCircle extends StatelessWidget {
  final String _name;

  const PetCircle({
    Key? key,
    required String name,
  })  : _name = name,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: AppColor.secundaryColor,
            child: CircleAvatar(
              radius: 27,
              backgroundColor: AppColor.background,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            child: Text(
              _name,
              style: AppTextStyle.petName,
            ),
          )
        ],
      ),
    );
  }
}
