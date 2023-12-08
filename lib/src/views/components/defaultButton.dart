import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(this.name, {Key? key, this.route, this.function}) : super(key: key);

  final String name;
  final String? route;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.of(context).size.width;
    double contextHeight = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        height: 0.06 * contextHeight,
        width: 0.20 * contextWidth,
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
