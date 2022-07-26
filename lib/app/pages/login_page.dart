import 'package:flutter/material.dart';
import 'package:mypets/app/components/button/app_button.dart';
import 'package:mypets/app/components/button/app_text_button.dart';
import 'package:mypets/app/components/form/app_form_text_field.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColor.background,
        child: Column(
          children: [
            Flexible(
              flex: 5125,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "MyPets",
                    style: AppTextStyle.appName,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: size.width * 0.4333,
                    height: size.height * 0.195,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColor.secundaryColor, width: 3),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3250,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46),
                child: Form(
                  child: Column(
                    children: const [
                      AppFormTextField(label: "E-mail ou Telefone"),
                      SizedBox(height: 15),
                      AppFormTextField(
                        label: "Senha",
                        isPassword: true,
                      ),
                      AppButton(
                        label: "Entrar",
                        padding: EdgeInsets.only(top: 25),
                      ),
                      AppTextButton(label: "Esqueci a senha?"),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 18),
                    child: AppTextButton(
                      label: "Não tem uma conta? Cadastre-se",
                      fontColor: AppColor.secundaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
