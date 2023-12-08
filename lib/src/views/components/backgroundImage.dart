import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
const BackgroundImage({ Key? key, required this.child }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              scale: 0.7,
              repeat: ImageRepeat.repeat,
            )
          )
        ),
        child
      ],
    );
  }
}