import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mypets/app/components/button/app_button.dart';
import 'package:mypets/app/components/form/app_form_datefield.dart';
import 'package:mypets/app/components/form/app_form_dropdown.dart';
import 'package:mypets/app/components/form/app_form_radio_button.dart';
import 'package:mypets/app/components/form/app_form_text_field.dart';
import 'package:mypets/app/pages/controller/cadastro_pet_controller.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';
import 'package:mypets/model/pet.dart';
import 'package:path/path.dart' as path;

class CadastroPetPage extends StatelessWidget {
  const CadastroPetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CadastroPetController controller = CadastroPetController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(context),
            _photoAndTitle(controller, context),
            const SizedBox(height: 15),
            _petForm(context, controller),
          ],
        ),
      ),
    );
  }
}

Widget _header(BuildContext context) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
      )
    ],
  );
}

Widget _photoAndTitle(CadastroPetController controller, BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 53,
            backgroundColor: AppColor.secundaryColor,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: AppColor.background,
              child: Observer(builder: (context) {
                return controller.downloadUrl == null
                    ? IconButton(
                        onPressed: () {
                          pickImage(controller);
                        },
                        icon: const Icon(Icons.add_a_photo_rounded),
                        iconSize: 50,
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(controller.downloadUrl!),
                      );
              }),
            ),
          ),
          const Text(
            "Quem é seu\n novo pet?",
            style: AppTextStyle.headerHome,
          ),
        ],
      ),
    ],
  );
}

Widget _petForm(BuildContext context, CadastroPetController controller) {
  final form = GlobalKey<FormState>();

  final controllerNome = TextEditingController();
  final controllerEspecie = TextEditingController();
  final controllerRaca = TextEditingController();
  final controllerDataNascimento = TextEditingController();
  final controllerPorte = TextEditingController();
  final controllerPeso = TextEditingController();
  final controllerSexo = TextEditingController();

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
    child: Form(
      key: form,
      child: Column(
        children: [
          AppFormTextField(
            label: "Nome",
            controller: controllerNome,
          ),
          AppFormDropdown(
            label: "Espécie",
            items: const ["Cachorro / Cadela", "Gato(a)"],
            controller: controllerEspecie,
          ),
          AppFormTextField(
            label: "Raça",
            controller: controllerRaca,
          ),
          AppFormDateField(
            label: "Data de nascimento",
            controller: controllerDataNascimento,
          ),
          AppFormDropdown(
            label: "Porte",
            items: const ["Pequeno", "Médio", "Grande"],
            controller: controllerPorte,
          ),
          AppFormTextField(
            label: "Peso (kl)",
            controller: controllerPeso,
            isNumeric: true,
          ),
          AppFormRadioListTile(
            controller: controllerSexo,
            label: "Sexo",
            listItem: const ["Macho", "Fêmea"],
            isRequired: true,
          ),
          const SizedBox(height: 15),
          AppButton(
            label: "Cadastrar",
            onPressed: () async {
              if (form.currentState!.validate()) {
                Pet pet = Pet(
                  controllerNome.text,
                  controllerEspecie.text,
                  controllerRaca.text,
                  DateFormat("dd/MM/yyyy").parse(controllerDataNascimento.text),
                  controllerPorte.text,
                  controllerPeso.text,
                  controllerSexo.text,
                  url: controller.downloadUrl,
                );
                controller.save(pet);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    ),
  );
}

void pickImage(CadastroPetController controller) async {
  final storageRef = FirebaseStorage.instance.ref();

  ImageSource source;
  XFile? image;

  ImageSource cameraSource = ImageSource.camera;
  // ignore: unused_local_variable
  ImageSource gallerySource = ImageSource.gallery;

  image = await ImagePicker().pickImage(source: cameraSource);

  if (image == null) return;

  final imageTemp = File(image.path);
  final String fileName = path.basename(image.path);

  final imagesRef = storageRef.child('/images/$fileName');

  try {
    await imagesRef.putFile(imageTemp);

    controller.downloadUrl =
        'https://firebasestorage.googleapis.com/v0/b/mypets-fiap.appspot.com/o/images%2F$fileName?alt=media';
  } catch (e) {
    print('error');
  }
}
