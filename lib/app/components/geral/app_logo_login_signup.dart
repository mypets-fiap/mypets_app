import 'package:flutter/material.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class AppLogoLoginSignUp extends StatelessWidget {
  const AppLogoLoginSignUp({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "MyPets",
          style: AppTextStyle.appName,
        ),
        SizedBox(height: size.height * 0.0375),
        Container(
          width: size.width * 0.4333,
          height: size.height * 0.195,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.secundaryColor, width: 3),
          ),
          child: Icon(
            Icons.pets_rounded,
            size: size.height * 0.1,
            color: AppColor.secundaryColor,
          ),
        ),
      ],
    );
  }
}
