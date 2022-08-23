import 'package:flutter/material.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';
import 'package:mypets/model/pet.dart';

class PetCircle extends StatelessWidget {
  final Pet _pet;

  const PetCircle({
    Key? key,
    required Pet pet,
  })  : _pet = pet,
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
            const CircleAvatar(
              radius: 30,
              backgroundColor: AppColor.secundaryColor,
              child: CircleAvatar(
                radius: 27,
                backgroundColor: AppColor.background,
                child: Icon(Icons.pets_rounded),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              child: Text(
                _pet.nome,
                style: AppTextStyle.petName,
              ),
            )
          ],
        ),
      ),
    );
  }
}
