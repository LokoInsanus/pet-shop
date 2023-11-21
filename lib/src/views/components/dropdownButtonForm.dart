import 'package:flutter/material.dart';
import 'package:pet_shop/src/models/cliente.dart';
import 'package:pet_shop/src/dao/memory/clienteDaoMemory.dart';

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
  late Cliente dono = Cliente(id: 0, nome: '', email: '', rua: '', bairro: '', numeroCasa: '', numeroTelefone: '', cpf: '');

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
              widget.textValue = (value as int) + 1;
              dono = ClienteDaoMemory().selecionarPorId(widget.textValue) as Cliente;
            });
          },
          hint: Text(dono.nome == "" ? "Donos" : dono.nome),
        )
      ),
    );
  }
}