import 'package:flutter/material.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';
import 'package:mypets/model/pet.dart';

class PetCircle extends StatelessWidget {
  final Pet _pet;
  final double _tamanho;
  final bool _exibeNome;

  const PetCircle({
    Key? key,
    required double tamanho,
    required Pet pet,
    bool exibeNome = false,
  })  : _pet = pet,
        _tamanho = tamanho,
        _exibeNome = exibeNome,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/detalhesPet',
            arguments: {'pet': _pet},
          );
        },
        child: Column(
          children: [
            CircleAvatar(
              radius: _tamanho,
              backgroundColor: AppColor.secundaryColor,
              child: _pet.url == null
                  ? CircleAvatar(
                      radius: _tamanho - 3,
                      backgroundColor: AppColor.background,
                      child: Icon(
                        Icons.pets_rounded,
                        size: _tamanho - 3,
                      ),
                    )
                  : CircleAvatar(
                      radius: _tamanho - 3,
                      backgroundImage: NetworkImage(_pet.url!),
                    ),
            ),
            _exibeNome
                ? Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: Text(
                      _pet.nome,
                      style: AppTextStyle.petName,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
