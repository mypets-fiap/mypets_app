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
            _cabecalho(context),
            _fotoETitulo(controller, context),
            const SizedBox(height: 15),
            _formulario(context, controller),
          ],
        ),
      ),
    );
  }
}

Widget _cabecalho(BuildContext context) {
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

Widget _fotoETitulo(CadastroPetController controller, BuildContext context) {
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
                          pickImage(context, controller);
                        },
                        icon: const Icon(Icons.add_a_photo_rounded),
                        iconSize: 50,
                      )
                    : GestureDetector(
                        onTap: () {
                          pickImage(context, controller);
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(controller.downloadUrl!),
                        ),
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

Widget _formulario(BuildContext context, CadastroPetController controller) {
  final form = GlobalKey<FormState>();

  final controllerNome = TextEditingController();
  final controllerEspecie = TextEditingController();
  final controllerRaca = TextEditingController();
  final controllerDataNascimento = TextEditingController();
  final controllerPorte = TextEditingController();
  final controllerPeso = TextEditingController();
  final controllerSexo = TextEditingController();
  String petEditId = '';

  bool editando = false;
  if (ModalRoute.of(context)?.settings.arguments != null) {
    editando = true;
    Map args = ModalRoute.of(context)?.settings.arguments as Map;
    Pet petEdit;
    petEdit = args['pet'];

    controllerNome.text = petEdit.nome;
    controllerEspecie.text = petEdit.especie;
    controllerRaca.text = petEdit.raca;
    controllerDataNascimento.text =
        DateFormat("dd/MM/yyyy").format(petEdit.dtNascimento);
    controllerPorte.text = petEdit.porte;
    controllerPeso.text = petEdit.peso;
    controllerSexo.text = petEdit.sexo;

    controller.downloadUrl = petEdit.url;
    petEditId = petEdit.id;
  }

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
            onPressed: () {
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
                if (editando) {
                  pet.id = petEditId;
                  controller.update(pet);
                } else {
                  controller.save(pet);
                }

                Navigator.pushNamed(context, "/homePage");
              }
            },
          ),
        ],
      ),
    ),
  );
}

void pickImage(BuildContext context, CadastroPetController controller) async {
  final storageRef = FirebaseStorage.instance.ref();

  XFile? image;

  ImageSource imageSource = await _cameraGaleria(context);

  image = await ImagePicker().pickImage(source: imageSource);

  if (image == null) return;

  final imageTemp = File(image.path);
  final String fileName = path.basename(image.path);

  final imagesRef = storageRef.child('/images/$fileName');

  try {
    await imagesRef.putFile(imageTemp);

    controller.downloadUrl =
        'https://firebasestorage.googleapis.com/v0/b/mypets-fiap.appspot.com/o/images%2F$fileName?alt=media';
  } catch (e) {
    controller.downloadUrl = "";
  }
}

Future<ImageSource> _cameraGaleria(BuildContext context) async {
  ImageSource imageSource = ImageSource.camera;
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      imageSource = ImageSource.camera;
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.add_a_photo),
                  ),
                  const Text("Camera"),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      imageSource = ImageSource.gallery;
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.folder),
                  ),
                  const Text("Galeria"),
                ],
              ),
            ],
          ),
        ]);
      });

  return imageSource;
}
