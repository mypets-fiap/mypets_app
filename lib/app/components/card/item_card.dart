import 'package:flutter/material.dart';
import 'package:mypets/model/servico.dart';

import '../../pages/util/app_color.dart';
import '../../pages/util/app_text_style.dart';

class ItemCard extends StatelessWidget {
  final Servico servico;

  const   ItemCard({
    Key? key,
    required this.servico,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: AppColor.secundaryColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(servico.imagemPath),
                ),
              )
            )
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 10),
          child: Text(servico.nome,style: AppTextStyle.petName),
        )
      ],
    );
  }
}
