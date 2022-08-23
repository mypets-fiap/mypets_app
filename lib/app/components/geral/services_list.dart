import 'package:flutter/material.dart';

import '../../../model/servico.dart';
import '../card/item_card.dart';

class ServicesList extends StatelessWidget {
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisExtent: 130,
                crossAxisSpacing: 40),
            itemBuilder: (context, index) =>
                ItemCard(servico: servicos[index])),
      ),
    );
  }
}
