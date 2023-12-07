import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(this.name, {Key? key, this.route, this.function}) : super(key: key);

  final String name;
  final String? route;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 60,
        width: 180,
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
            backgroundColor: MaterialStateProperty.all(Color(0xCC0000AA)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
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
