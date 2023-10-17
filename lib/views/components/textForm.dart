import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

// ignore: must_be_immutable
class TextForm extends StatelessWidget {
  TextForm({Key? key, required this.name, this.max, this.cpf = false}) : super(key: key) {
    if(cpf) {
      cpfMask = MaskedTextController(mask: '000.000.000-00');
      max = 14;
    }
  }

  final String name;
  final bool cpf;

  late int? max;
  MaskedTextController? cpfMask;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: TextFormField(
          controller: cpfMask,
          maxLength: max,
          decoration: InputDecoration(
            labelText: name,
          ),
        ),
      ),
    );
  }
}
