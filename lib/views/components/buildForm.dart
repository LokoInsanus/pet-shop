import 'package:flutter/material.dart';
import 'package:pet_shop/views/components/textForm.dart';

// ignore: must_be_immutable
class BuildForm extends StatelessWidget {
  BuildForm(this.fields, {Key? key, this.heights, this.cpfField, this.numero}) : super(key: key) {
    textFields = [];
    for (var text in fields) {
      textFields.add(SizedBox(height: heights,));
      if(text == cpfField) {
        textFields.add(TextForm(text, cpf: true,));
      }
      else if(text == numero) {
        textFields.add(TextForm(text, numero: true));
      }
      else {
        textFields.add(TextForm(text,));
      }
    }
  }

  final List<String> fields;
  late List<Widget> textFields;
  double? heights;
  String? cpfField;
  String? numero;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: textFields,
    );
  }
}
