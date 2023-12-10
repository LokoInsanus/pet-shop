import 'package:flutter/material.dart';

class Back extends StatelessWidget {
const Back({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ElevatedButton.icon(
      onPressed: () => Navigator.of(context).pop(),
      icon: Icon(Icons.arrow_back, color: Colors.black, size: 20,),
      label: Text(''),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Color(0xFF2B31BB))
      ),
    );
  }
}