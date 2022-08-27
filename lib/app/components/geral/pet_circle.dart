import 'package:flutter/material.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';
import 'package:mypets/model/pet.dart';

class PetCircle extends StatelessWidget {
  final double _tamanho;
  final Pet? _pet;
  final bool _exibeNome;
  final Function()? _onTap;

  const PetCircle({
    Key? key,
    required double tamanho,
    Pet? pet,
    bool exibeNome = false,
    Function()? onTap,
  })  : _tamanho = tamanho,
        _pet = pet,
        _onTap = onTap,
        _exibeNome = exibeNome,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: _onTap,
        child: Column(
          children: [
            CircleAvatar(
              radius: _tamanho,
              backgroundColor: AppColor.secundaryColor,
              child: _pet != null && _pet!.url == null
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
                      backgroundImage: NetworkImage(_pet!.url!),
                    ),
            ),
            _exibeNome && _pet != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: Text(
                      _pet!.nome.length < 7
                          ? _pet!.nome
                          : "${_pet!.nome.substring(0, 7)}...",
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
