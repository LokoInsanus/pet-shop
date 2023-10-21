import 'package:flutter/material.dart';

class ButtonForm extends StatelessWidget {
  const ButtonForm(this.name, {Key? key, this.route, this.function}) : super(key: key);

  final String name;
  final String? route;
  final Function? function;

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
              else if(function != null) {
                function;
              }
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 25,
              ),
            )),
      ),
    );
  }
}
