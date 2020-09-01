import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/messaging_widget.dart';
import 'package:flutterapp/widgets/navigation_drawer.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:AppBar(
        title: Text('messaging'),
      ) ,
      body: MessagingWidget() ,

    );
  }
}
