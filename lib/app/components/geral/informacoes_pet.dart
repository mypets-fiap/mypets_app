import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';
import 'package:mypets/model/pet.dart';

class InformacoesPet extends StatefulWidget {
  final Pet _pet;

  const InformacoesPet({
    Key? key,
    required Pet pet,
  })  : _pet = pet,
        super(key: key);

  @override
  State<InformacoesPet> createState() => _InformacoesPetState();
}

class _InformacoesPetState extends State<InformacoesPet> {
  bool aberto = false;

  @override
  Widget build(BuildContext context) {
    Pet pet = super.widget._pet;
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          aberto = !aberto;
        });
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (context, aberto) {
            return const Center(
              child: Text(
                "Informações do Pet",
                style: AppTextStyle.headerHome,
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _informacao("Nome", pet.nome),
                  _informacao("Espécie", pet.especie),
                  _informacao("Raça", pet.raca),
                  _informacao("Data de Nascimento",
                      DateFormat("dd/MM/yyyy").format(pet.dtNascimento)),
                  _informacao("Porte", pet.porte),
                  _informacao("Peso", pet.peso),
                  _informacao("Sexo", pet.sexo),
                ],
              ),
            ),
          ),
          isExpanded: aberto,
        ),
      ],
    );
  }
}

Widget _informacao(String campo, String valor) {
  return Row(
    children: [
      Text(
        "$campo: ",
        style: AppTextStyle.headerTable,
      ),
      Text(
        valor,
        style: AppTextStyle.dataTable,
      )
    ],
  );
}
