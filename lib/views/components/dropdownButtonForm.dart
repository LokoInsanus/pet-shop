import 'package:flutter/material.dart';
import 'package:pet_shop/models/cliente.dart';

// ignore: must_be_immutable
class DropdownButtonForm extends StatefulWidget {
  DropdownButtonForm(this.donos, { Key? key }) : super(key: key);

  final List<Cliente> donos;

  late int textValue;

  @override
  State<DropdownButtonForm> createState() => _DropdownButtonFormState();
}

class _DropdownButtonFormState extends State<DropdownButtonForm> {
  late List<String> nomeDonos = widget.donos.map((cliente) => cliente.nome).toList();

  @override
  Widget build(BuildContext context){
    return Center(
      child: SizedBox(
        height: 50,
        width: 500,
        child: DropdownButton(
          items: nomeDonos.asMap().entries.map((entry) {
            int index = entry.key;
            String dono = entry.value;
            return DropdownMenuItem(
              value: index,
              child: Text(dono),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              widget.textValue = value! + 1;
            });
          },
          hint: const Text('Donos'),
        )
      ),
    );
  }
}