import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
class textForm extends StatelessWidget {
  textForm({super.key, required this.name, this.max, this.cpf = false}) {
    if(cpf) {
      cpfMask = MaskedTextController(mask: '000.000.000-00');
      max = 14;
    }
  }

  final String name;
  final bool cpf;

  int? max;
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
