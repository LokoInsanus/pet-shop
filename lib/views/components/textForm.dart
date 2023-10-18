import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

// ignore: must_be_immutable
class TextForm extends StatelessWidget {
  TextForm(this.name, {Key? key, this.max, this.cpf = false, this.numero = false}) : super(key: key) {
    if(cpf) {
      mask = MaskedTextController(mask: '000.000.000-00');
      max = 14;
    }
    else if(numero) {
      mask = MaskedTextController(mask: '(00) 00000-0000');
      max = 15;
    }
  }

  final String name;
  final bool cpf;
  final bool numero;

  late int? max;
  MaskedTextController? mask;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: TextField(
          controller: mask,
          maxLength: max,
          decoration: InputDecoration(
            labelText: name,
            counterText: ''
          ),
        ),
      ),
    );
  }
}
