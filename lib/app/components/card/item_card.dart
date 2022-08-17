import 'package:flutter/material.dart';
import 'package:mypets/model/servico.dart';

import '../../pages/util/app_color.dart';

class ItemCard extends StatelessWidget{

  final Servico servico;

  const ItemCard({
    Key? key,
    required this.servico,
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: AppColor.borderSideColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Image.asset(servico.imagemPath)
            )
        ),
        Text(servico.nome)
      ],
    );
  }
}


