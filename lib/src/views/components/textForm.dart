import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: must_be_immutable
class TextForm extends StatefulWidget {
  TextForm(this.name, {Key? key, this.max, this.cpf = false, this.telefone = false, this.rga = false, this.invalid = false, this.onChanged, this.password = false, this.icon}) : super(key: key) {
    if (cpf) {
      mask = MaskTextInputFormatter(mask: '000.000.000-00', filter: {"0": RegExp(r'[0-9]')},);
      max = 14;
    }
    else if (telefone) {
      mask = MaskTextInputFormatter(mask: '(00) 00000-0000', filter: {"0": RegExp(r'[0-9]')},);
      max = 15;
    }
    else if(rga) {
      mask = MaskTextInputFormatter(mask: '0.000.000', filter: {"0": RegExp(r'[0-9]')},);
      max = 9;
    }
  }

  final String name;
  final bool cpf;
  final bool telefone;
  final bool rga;
  final bool password;
  final Icon? icon;
  final ValueChanged<String>? onChanged;

  late bool invalid;
  late int? max;
  MaskTextInputFormatter mask = MaskTextInputFormatter(mask: '');

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        child: TextField(
          obscureText: widget.password,
          onChanged: widget.onChanged,
          controller: textController,
          inputFormatters: [widget.mask],
          maxLength: widget.max,
          decoration: InputDecoration(
            hintText: widget.name, 
            counterText: '',
            errorText: widget.invalid == true ? 'Campo Invalido' : null,
            prefixIcon: widget.icon,
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 40, top: (widget.icon != null ? 15: 0))
          ),
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xCC00BCFF),
          borderRadius: BorderRadius.circular(15),
          
        ),
      ),
    );
  }
}
