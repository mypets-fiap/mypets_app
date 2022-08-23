import 'package:flutter/material.dart';

import '../../../model/servico.dart';
import '../card/item_card.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Servico> servicos = [];
    servicos.add(Servico("Pet-Shop", "assets/images/petshop.png"));
    servicos.add(Servico("Hotel", "assets/images/hotel-animal.png"));
    servicos.add(Servico("Banho e tosa", "assets/images/banho-tosa.png"));
    servicos.add(Servico("Taxi-Pet", "assets/images/taxi.png"));
    servicos.add(Servico("Veterinário", "assets/images/veterinario.png"));

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: GridView.builder(
            itemCount: servicos.length,
            primary: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) =>
                ItemCard(servico: servicos[index])),
      ),
    );
  }
}
