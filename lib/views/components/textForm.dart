import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

// ignore: must_be_immutable
class TextForm extends StatelessWidget {
  TextForm(this.name, {Key? key, this.max, this.cpf = false, this.telefone = false, this.rga = false}) : super(key: key) {
    if (cpf) {
      mask = MaskedTextController(mask: '000.000.000-00');
      max = 14;
    }
    else if (telefone) {
      mask = MaskedTextController(mask: '(00) 00000-0000');
      max = 15;
    }
    else if(rga) {
      mask = MaskedTextController(mask: '0.000.000');
      max = 9;
    }

    textController = TextEditingController();
    textController.addListener(() {
      textValue = textController.text;
    });
  }

  final String name;
  final bool cpf;
  final bool telefone;
  final bool rga;

  late int? max;
  late TextEditingController textController;
  String textValue = '';
  MaskedTextController? mask;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: TextField(
          onChanged: (value) {
            textValue = value;
          },
          controller: mask,
          maxLength: max,
          decoration: InputDecoration(labelText: name, counterText: ''),
        ),
      ),
    );
  }
}
