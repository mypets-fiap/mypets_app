import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mypets/app/components/button/app_button.dart';
import 'package:mypets/app/components/form/app_form_text_field.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class CadastroPetPage extends StatelessWidget {
  const CadastroPetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(context),
            _photoAndTitle(),
            const SizedBox(height: 15),
            _petForm(),
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
                  print('ccccc');
                  teste();
                },
                icon: const Icon(Icons.add_a_photo_rounded),
                iconSize: 50,
              ),
            ),
          ),
          Text(
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

Widget _petForm() {
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
          AppFormTextField(label: "Nome", controller: controllerNome),
          AppFormTextField(label: "Espécie", controller: controllerEspecie),
          AppFormTextField(label: "Raça", controller: controllerRaca),
          AppFormTextField(
            label: "Data de nascimento",
            controller: controllerDataNascimento,
          ),
          AppFormTextField(label: "Porte", controller: controllerPorte),
          AppFormTextField(label: "Peso", controller: controllerPeso),
          AppFormTextField(label: "Sexo", controller: controllerSexo),
          const SizedBox(height: 15),
          AppButton(
            label: "Cadastrar",
            onPressed: () {
              if (form.currentState!.validate()) {}
            },
          ),
        ],
      ),
    ),
  );
}

void teste() async {
  ImageSource source;
  XFile? image;

  ImageSource cameraSource = ImageSource.camera;
  // ignore: unused_local_variable
  ImageSource gallerySource = ImageSource.gallery;

  image = await ImagePicker().pickImage(source: cameraSource);

  if (image == null) return;

  final imageTemp = XFile(image.path);
  print('aaaaaaaaaaaaaaaaaaa ${imageTemp.path}');
  print('bbbbbbbbbbbbb ${imageTemp}');
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
