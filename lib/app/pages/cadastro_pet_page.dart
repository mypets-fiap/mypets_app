import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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
            _photoAndTitle(),
            const SizedBox(height: 15),
            _petForm(controller),
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

Widget _photoAndTitle() {
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
              child: IconButton(
                onPressed: () {
                  pickImage();
                },
                icon: const Icon(Icons.add_a_photo_rounded),
                iconSize: 50,
              ),
            ),
          ),
          const Text(
            "Quem é seu\n novo pet?",
            style: AppTextStyle.headerHome,
          ),
        ],
      ),
    ],
    // FutureBuilder<void>(
    //   future: retrieveLostData(),
    //   builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
    //     switch (snapshot.connectionState) {
    //       case ConnectionState.none:
    //       case ConnectionState.waiting:
    //         return const Text(
    //           'You have not yet picked an image.',
    //           textAlign: TextAlign.center,
    //         );
    //       case ConnectionState.done:
    //         return _handlePreview();
    //       default:
    //         if (snapshot.hasError) {
    //           return Text(
    //             'Pick image/video error: ${snapshot.error}}',
    //             textAlign: TextAlign.center,
    //           );
    //         } else {
    //           return const Text(
    //             'You have not yet picked an image.',
    //             textAlign: TextAlign.center,
    //           );
    //         }
    //     }
    //   },
    // )
  );
}

Future<void> retrieveLostData() async {
  final LostDataResponse response = await ImagePicker().retrieveLostData();
  print('response $response');
  if (response.isEmpty) {
    return;
  }
  // if (response.file != null) {
  //   if (response.type == RetrieveType.video) {
  //     isVideo = true;
  //     await _playVideo(response.file);
  //   } else {
  //     isVideo = false;
  //     setState(() {
  //       if (response.files == null) {
  //         _setImageFileListFromFile(response.file);
  //       } else {
  //         _imageFileList = response.files;
  //       }
  //     });
  //   }
  // } else {
  //   _retrieveDataError = response.exception!.code;
  // }
}

Widget _petForm(CadastroPetController controller) {
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
            items: const ["Cachorro", "Gato"],
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
          AppFormTextField(
            label: "Porte",
            controller: controllerPorte,
          ),
          AppFormTextField(
            label: "Peso",
            controller: controllerPeso,
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
                  controllerSexo.text,
                );
                controller.save(pet);
              }
            },
          ),
        ],
      ),
    ),
  );
}

void pickImage() async {
  final storageRef = FirebaseStorage.instance.ref();

  ImageSource source;
  XFile? image;

  ImageSource cameraSource = ImageSource.camera;
  // ignore: unused_local_variable
  ImageSource gallerySource = ImageSource.gallery;

  image = await ImagePicker().pickImage(source: cameraSource);

  if (image == null) return;

  // print('bbbbbbbbbb ${image.path}');

  // final imageTemp = XFile(image.path);
  final imageTemp = File(image.path);
  final String fileName = path.basename(image.path);

  final mountainImagesRef = storageRef.child('/images/$fileName');

  print('aaaaaaaaaaaaaaaaaaa $imageTemp');
  print('bbbbbbbbbbbbbbbbbbb $mountainImagesRef');
  print('ccccccccccccccccccc $fileName');

  try {
    //  await _auth.currentUser?.getIdToken();
    // Future token = await AuthenticationHelper().getToken();
    // print('LLLLLLLLLLLLLLLLLLLLLL ${token}');
    await mountainImagesRef.putFile(imageTemp);
  } catch (e) {
    print('error');
  }
}

// Widget _handlePreview() {
//   if (isVideo) {
//     return _previewVideo();
//   } else {
//     return _previewImages();
//   }
// }

// Widget _previewVideo() {
//   final Text? retrieveError = _getRetrieveErrorWidget();
//   if (retrieveError != null) {
//     return retrieveError;
//   }
//   if (_controller == null) {
//     return const Text(
//       'You have not yet picked a video',
//       textAlign: TextAlign.center,
//     );
//   }
//   return Padding(
//     padding: const EdgeInsets.all(10.0),
//     child: AspectRatioVideo(_controller),
//   );
// }

// Widget _previewImages() {
//   final Text? retrieveError = _getRetrieveErrorWidget();
//   if (retrieveError != null) {
//     return retrieveError;
//   }
//   if (_imageFileList != null) {
//     return Semantics(
//       label: 'image_picker_example_picked_images',
//       child: ListView.builder(
//         key: UniqueKey(),
//         itemBuilder: (BuildContext context, int index) {
//           // Why network for web?
//           // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
//           return Semantics(
//             label: 'image_picker_example_picked_image',
//             child: kIsWeb
//                 ? Image.network(_imageFileList![index].path)
//                 : Image.file(File(_imageFileList![index].path)),
//           );
//         },
//         itemCount: _imageFileList!.length,
//       ),
//     );
//   } else if (_pickImageError != null) {
//     return Text(
//       'Pick image error: $_pickImageError',
//       textAlign: TextAlign.center,
//     );
//   } else {
//     return const Text(
//       'You have not yet picked an image.',
//       textAlign: TextAlign.center,
//     );
//   }
// }
