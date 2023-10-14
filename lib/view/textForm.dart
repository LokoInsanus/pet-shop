import 'package:flutter/material.dart';

class textForm extends StatelessWidget {
  const textForm({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    String _name = name;

    return Center(
      child: Container(
        child: Form(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: _name,
            ),
          ),
        ),
        width: 500,
      ),
    );
  }
}
