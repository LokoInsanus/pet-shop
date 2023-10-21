import 'package:flutter/material.dart';
import 'package:pet_shop/dao/memory/clienteDaoMemory.dart';

Widget CreateTable() {
  return DataTable(
    columns: [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Nome')),
      DataColumn(label: Text('Email')),
      DataColumn(label: Text('Rua')),
      DataColumn(label: Text('Bairro')),
      DataColumn(label: Text('Número')),
      DataColumn(label: Text('Telefone')),
      DataColumn(label: Text('CPF')),
    ],
    rows: [
      DataRow(cells: [
        DataCell(Text('ID')),
        DataCell(Text('Nome')),
        DataCell(Text('Email')),
        DataCell(Text('Rua')),
        DataCell(Text('Bairro')),
        DataCell(Text('Número')),
        DataCell(Text('Telefone')),
        DataCell(Text('CPF')),
      ]),
      DataRow(cells: [
        DataCell(Text('ID')),
        DataCell(Text('Nome')),
        DataCell(Text('Email')),
        DataCell(Text('Rua')),
        DataCell(Text('Bairro')),
        DataCell(Text('Número')),
        DataCell(Text('Telefone')),
        DataCell(Text('CPF')),
      ])
    ],
  );
}