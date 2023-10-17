import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Shop - Home'),
        centerTitle: true,
      ),
      body: Column(children: [
        SizedBox(height: 20,),
        Center(
          child: SizedBox(
            height: 50,
            width: 500,
            child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/cliente');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ), 
                child: Text('Cadastrar Cliente')),
          ),
        ),
      ]),
    );
  }
}
