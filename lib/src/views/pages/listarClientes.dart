import 'package:flutter/material.dart';
import 'package:pet_shop/src/dao/clienteDao.dart';
import 'package:pet_shop/src/dao/memory/clienteDaoMemory.dart';
import 'package:pet_shop/src/views/components/back.dart';
import 'package:pet_shop/src/views/components/backgroundImage.dart';
import 'package:pet_shop/src/views/components/createClienteRows.dart';

// ignore: must_be_immutable
class ListarClientes extends StatelessWidget {
  ListarClientes({ Key? key }) : super(key: key);

  ClienteDao clienteDao = ClienteDaoMemory();

  @override
  Widget build(BuildContext context){
    double contextWidth = MediaQuery.of(context).size.width;
    double contextHeight = MediaQuery.of(context).size.height;
    return Material(
      child: BackgroundImage(
        child: Stack(
          children: [
            ListView(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xB2000088)
                    ),
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('ID'), ),
                        DataColumn(label: Text('Nome')),
                        DataColumn(label: Text('Email')),
                        DataColumn(label: Text('Rua')),
                        DataColumn(label: Text('Bairro')),
                        DataColumn(label: Text('Número')),
                        DataColumn(label: Text('Telefone')),
                        DataColumn(label: Text('CPF')),
                        DataColumn(label: Text('')),
                      ],
                      rows: CreateClienteRows(context),
                      dataRowColor: MaterialStateProperty.all(const Color(0xCCCFF4FF)),
                      dataTextStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ]
            ),
            Container(
              margin: EdgeInsets.only(top: 0.025 * contextHeight, left: 0.02 * contextWidth),
              child: const Back()
            ),            
          ],
        ),
      )
    );
  }
}