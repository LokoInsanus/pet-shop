import 'package:flutter/material.dart';
import 'package:pet_shop/views/components/textForm.dart';

// ignore: must_be_immutable
class BuildForm extends StatelessWidget {
  BuildForm(this.fields, {Key? key, this.heights, this.cpfField}) : super(key: key) {
    textFields = [];
    for (var i in fields) {
      textFields.add(SizedBox(height: heights,));
      if(i != cpfField)
        textFields.add(TextForm(name: i));
      else
        textFields.add(TextForm(name: i, cpf: true));
    }
  }

  final List<String> fields;
  late List<Widget> textFields;
  double? heights;
  String? cpfField;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: textFields,
    );
  }
}
