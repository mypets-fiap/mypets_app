
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../model/event_pet.dart';
import '../../pages/util/app_color.dart';
import '../../pages/util/app_text_style.dart';

class RemindersTable extends StatelessWidget {

  const RemindersTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 210,
      child: ListView(
        padding: const EdgeInsets.only(left: 16, right: 16),
        children: [
          _createDataTableReminders()
        ],
      ),
    );
  }

  DataTable _createDataTableReminders() {
    return DataTable(
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.secundaryColor, width: 1,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10.0),
            color: AppColor.backgroudColor
        ),
        columns: _createColumns(),
        rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return const [
      DataColumn(label: Text('Data', style: AppTextStyle.headerTable)),
      DataColumn(label: Text('Compromisso', style: AppTextStyle.headerTable)),
      DataColumn(label: Text('Pet', style: AppTextStyle.headerTable))
    ];
  }

  List<DataRow> _createRows() {
    final DateFormat formatter = DateFormat('dd/MM');
    List scheduleList = [];
    scheduleList.add(EventPet(DateTime.now(), "Dentista", "Rodolfo"));
    scheduleList.add(EventPet(DateTime.now(), "Banho", "Sheilo"));
    scheduleList.add(EventPet(DateTime.now(), "Cirurgia", "Piggy"));
    scheduleList.add(EventPet(DateTime.now(), "Cirurgia", "Piggy"));
    scheduleList.add(EventPet(DateTime.now(), "Cirurgia", "Piggy"));
    scheduleList.add(EventPet(DateTime.now(), "Cirurgia", "Piggy"));
    scheduleList.add(EventPet(DateTime.now(), "Cirurgia", "Piggy"));

    return [
      for(var rowData in scheduleList)
        DataRow(cells: [
          DataCell(Text(formatter.format(rowData.data), style: AppTextStyle.dataTable)),
          DataCell(Text(rowData.compromisso, style: AppTextStyle.dataTable)),
          DataCell(Text(rowData.pet, style: AppTextStyle.dataTable)),
        ])
    ];
  }
}