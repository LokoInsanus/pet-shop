import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

// ignore: must_be_immutable
class TextForm extends StatefulWidget {
  TextForm(this.name, {Key? key, this.max, this.cpf = false, this.telefone = false}) : super(key: key) {
    if (cpf) {
      mask = MaskedTextController(mask: '000.000.000-00');
      max = 14;
    }
    else if (telefone) {
      mask = MaskedTextController(mask: '(00) 00000-0000');
      max = 15;
    }
  }

  final String name;
  final bool cpf;
  final bool telefone;

  late int? max;
  String textValue = '';
  MaskedTextController? mask;

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  late String textValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: TextField(
          onChanged: (value) => textValue,
          controller: widget.mask,
          maxLength: widget.max,
          decoration: InputDecoration(labelText: widget.name, counterText: ''),
        ),
      ),
    );
  }
}
