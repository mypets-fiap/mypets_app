import 'package:flutter/material.dart';
import 'package:mypets/app/components/button/app_button.dart';
import 'package:mypets/app/components/button/app_text_button.dart';
import 'package:mypets/app/components/form/app_form_text_field.dart';
import 'package:mypets/app/components/geral/app_logo_login_signup.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';
import 'package:mypets/service/login_service.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 50, left: 17, right: 17),
        children: <Widget>[
          // logo
          const AppLogoLoginSignUp(size: Size(500, 500)),
          const SizedBox(height: 50),
          const Text(
            'Cadastre-se:',
            style: AppTextStyle.headerHome,
          ),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SignupForm(),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              AppTextButton(
                label: "Já tem um acesso? Faça Login",
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  bool agree = false;

  final _controllerFullName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPass = TextEditingController();
  final _controllerConfirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const SizedBox(height: 15),
          AppFormTextField(
            label: "Email",
            controller: _controllerEmail,
          ),
          const SizedBox(height: 15),
          AppFormTextField(
            label: "Senha",
            controller: _controllerPass,
            isPassword: true,
          ),
          const SizedBox(height: 15),
          AppFormTextField(
            label: "Confirme a Senha",
            controller: _controllerConfirmPass,
            isPassword: true,
            controllerValidateEquals: _controllerPass,
          ),
          const SizedBox(height: 15),
          AppFormTextField(
            label: "Nome Completo",
            controller: _controllerFullName,
          ),
          const SizedBox(height: 15),

          Row(
            children: <Widget>[
              Checkbox(
                onChanged: (_) {
                  setState(() {
                    agree = !agree;
                  });
                },
                value: agree,
              ),
              const Flexible(
                child: Text(
                    'Concordo com os Termos e Condições e a Política de Privacidade.'),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          // signUP button
          SizedBox(
              height: 50,
              width: double.infinity,
              child: AppButton(
                label: "Cadastrar",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (agree == false) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Aceite os termos",
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    } else {
                      _formKey.currentState!.save();

                      LoginService loginService = LoginService();

                      if (await loginService.novoUsuario(
                        _controllerEmail.text,
                        _controllerPass.text,
                      )) {
                        Navigator.pushNamed(context, "/");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Algo deu errado",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      }
                    }
                  }
                },
              )),
        ],
      ),
    );
  }
}
