import 'package:flutter/material.dart';
import 'package:pet_shop/src/views/components/back.dart';
import 'package:pet_shop/src/views/components/backgroundImage.dart';
import 'package:pet_shop/src/views/components/createPetRows.dart';

class ListarPets extends StatelessWidget {
const ListarPets({ Key? key }) : super(key: key);

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
                        DataColumn(label: Text('ID')),
                        DataColumn(label: Text('Nome')),
                        DataColumn(label: Text('Dono')),
                        DataColumn(label: Text('Animal')),
                        DataColumn(label: Text('Raça')),
                        DataColumn(label: Text('RGA')),
                        DataColumn(label: Text('')),
                      ],
                      rows: CreatePetRows(context),
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