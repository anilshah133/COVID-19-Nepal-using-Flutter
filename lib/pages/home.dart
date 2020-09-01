import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {

  void delay() async{
   await Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacementNamed(context, '/summary');

    });

  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    delay();
    return  Scaffold(
      appBar: AppBar(

        title: Text('COVID-19 UPDATE HOME'),
      ),
      body: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(image: AssetImage('assets/cv19.png'),
              // fit: BoxFit.fill,
            )
        ),
        child: Center(
          child: Text(
            '\n\n\n\n\n\n\n\n\n\n\n\nloading....',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      )

    );


  }
}
