
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

import '../../model/event_pet.dart';
import '../components/geral/pet_circle.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: header(),
          ),
          pets(),
          schedule()
        ],
      ),
    );
  }
}

Widget header() {
  return Column(
    children: [
      Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 35),
            child: Text("Olá, Caio", style: AppTextStyle.headerHome),
          ),
        ],
      ),
      Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text("Seus pets", style: AppTextStyle.section),
          ),
        ],
      ),
    ],
  );
}

Widget pets() {
  List<String> pets = [];
  pets.add("Rodolfo");
  pets.add("Sheilo");
  pets.add("Corintiano");
  pets.add("Piggy");
  pets.add("Pidgey");
  pets.add("Pikachu");
  pets.add("Squirtle");
  pets.add("Pidgey");

  return SizedBox(
    height: 75,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pets.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == pets.length) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add),
                  Text(
                    "Novo pet",
                    style: AppTextStyle.petName,
                  )
                ],
              ),
            );
          } else {
            return PetCircle(name: pets[index]);
          }
        }),
  );
}

Widget schedule() {

  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  List<EventPet> scheduleList = [];
  scheduleList.add(EventPet(DateTime.now(), "Dentista", "Rodolfo"));
  scheduleList.add(EventPet(DateTime.now(), "Banho", "Sheilo"));
  scheduleList.add(EventPet(DateTime.now(), "Cirurgia", "Piggy"));

  return DataTable(
    border: const TableBorder(top: BorderSide(color: AppColor.secundaryColor, width: 1,style: BorderStyle.solid),
                        right: BorderSide(color: AppColor.secundaryColor, width: 1,style: BorderStyle.solid),
                        bottom: BorderSide(color: AppColor.secundaryColor, width: 1,style: BorderStyle.solid),
                        left: BorderSide(color: AppColor.secundaryColor, width: 1,style: BorderStyle.solid),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),)),
    headingRowColor: MaterialStateColor.resolveWith((states) => AppColor.backgroudColor),
    dataRowColor: MaterialStateColor.resolveWith((states) => AppColor.backgroudColor),
    columns: const [
      DataColumn(label: Text('Data', style: AppTextStyle.headerTable)),
      DataColumn(label: Text('Compromisso', style: AppTextStyle.headerTable)),
      DataColumn(label: Text('Pet', style: AppTextStyle.headerTable))
    ], 
    rows: [
      for(var rowData in scheduleList)
        DataRow(cells: [
          DataCell(Text(formatter.format(rowData.data), style: AppTextStyle.dataTable)),
          DataCell(Text(rowData.compromisso, style: AppTextStyle.dataTable)),
          DataCell(Text(rowData.pet, style: AppTextStyle.dataTable)),
        ])
    ],
      

    
  );
}