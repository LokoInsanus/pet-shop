import 'package:flutter/material.dart';
import 'package:pet_shop/src/models/cliente.dart';
import 'package:pet_shop/src/dao/memory/clienteDaoMemory.dart';

// ignore: must_be_immutable
class DropdownButtonForm extends StatefulWidget {
  DropdownButtonForm(this.donos, { Key? key, this.placeholder }) : super(key: key);

  final List<Cliente> donos;
  late int textValue;
  final String? placeholder;

  @override
  State<DropdownButtonForm> createState() => _DropdownButtonFormState();
}

class _DropdownButtonFormState extends State<DropdownButtonForm> {
  late List<String> nomeDonos = widget.donos.map((cliente) => cliente.nome).toList();
  late Cliente dono = Cliente(id: 0, nome: '', email: '', rua: '', bairro: '', numeroCasa: '', numeroTelefone: '', cpf: '');

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        height: 50,
        width: 500,
        decoration: BoxDecoration(
          color: const Color(0xCC00BCFF),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.only(left: 40),
        child: DropdownButton(
          items: nomeDonos.asMap().entries.map((entry) {
            int index = entry.key;
            String dono = entry.value;
            return DropdownMenuItem(
              value: index,
              child: Text(dono),
            );
          }).toList(),
          dropdownColor: Color(0xCC00BCFF),
          onChanged: (value) {
            setState(() {
              widget.textValue = (value as int) + 1;
              dono = ClienteDaoMemory().selecionarPorId(widget.textValue) as Cliente;
            });
          },
          underline: Container(color: Colors.transparent),
          hint: Text(dono.nome == "" ? "Donos" : dono.nome,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),),
        )
      ),
    );
  }
}