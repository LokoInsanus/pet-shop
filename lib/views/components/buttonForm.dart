import 'package:flutter/material.dart';

class ButtonForm extends StatelessWidget {
  const ButtonForm(this.name, {Key? key, this.route}) : super(key: key);

  final String name;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        width: 500,
        child: OutlinedButton(
          onPressed: () {
            if(route != null) {
              Navigator.of(context).pushNamed(route!);
            }
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
          ),
          child: Text(name,
            style: const TextStyle(
              fontSize: 25,
            ),
          )
        ),
      ),
    );
  }
}
