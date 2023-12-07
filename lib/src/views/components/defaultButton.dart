import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(this.name, {Key? key, this.route, this.function}) : super(key: key);

  final String name;
  final String? route;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 80,
        width: 350,
        child: OutlinedButton(
          onPressed: () {
            if(route != null) {
              Navigator.of(context).pushNamed(route ?? "/");
            }
            if(function != null) {
              function!();
            }
          },
          style: ButtonStyle(
            //foregroundColor: MaterialStateProperty.all(),
            backgroundColor: MaterialStateProperty.all(const Color(0xCC8ED8ED)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)
              )
            ),
          ),
          child: Text(
            name,
            style: const TextStyle(
              color: Color(0xAA000000),
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700
            ),
          )
        ),
      ),
    );
  }
}
