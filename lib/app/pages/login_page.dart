import 'package:flutter/material.dart';
import 'package:mypets/app/components/button/app_button.dart';
import 'package:mypets/app/components/button/app_text_button.dart';
import 'package:mypets/app/components/form/app_form_text_field.dart';
import 'package:mypets/app/components/geral/app_logo_login_signup.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/service/login_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _form = GlobalKey<FormState>();
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();

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
              flex: 5000,
              child: AppLogoLoginSignUp(size: size),
            ),
            Flexible(
              flex: 3250,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46),
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      AppFormTextField(
                        label: "E-mail",
                        controller: _controllerLogin,
                      ),
                      const SizedBox(height: 15),
                      AppFormTextField(
                        label: "Senha",
                        isPassword: true,
                        controller: _controllerSenha,
                      ),
                      AppButton(
                        label: "Entrar",
                        padding: const EdgeInsets.only(top: 25),
                        onPressed: () async {
                          if (_form.currentState!.validate()) {
                            LoginService login = LoginService();

                            if (await login.entrar(
                              _controllerLogin.text,
                              _controllerSenha.text,
                            )) {
                              Navigator.pushNamed(context, "/homePage");
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  "Verifique seu e-mail e senha",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ));
                            }
                          }
                        },
                      ),
                      AppTextButton(
                        label: "Esqueci a senha?",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: AppTextButton(
                      label: "Não tem uma conta? Cadastre-se",
                      fontColor: AppColor.secundaryColor,
                      onPressed: () {
                        Navigator.pushNamed(context, "/signUp");
                      },
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
