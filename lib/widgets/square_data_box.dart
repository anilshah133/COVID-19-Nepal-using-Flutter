import 'package:flutter/material.dart';

class SquareDataBox extends StatefulWidget {
  String _case_type;
  String _value;

  SquareDataBox(this._case_type, this._value);
  @override
  _SquareDataBoxState createState() => _SquareDataBoxState(_case_type,_value);
}

class _SquareDataBoxState extends State<SquareDataBox> {
  String _case_type;
  String _value;

  _SquareDataBoxState(this._case_type, this._value);

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(

          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(image: AssetImage('assets/bg3.jpg'),
                  fit: BoxFit.fill,
                )
            ),

            child:
            Center(
              child:
              Column(
                children: <Widget>[

                  Text(
                    '\n\n'+_value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    '\n'+_case_type,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),

                ],
              ),

            ),




            height: data.size.height/4.5,
            width: data.size.width/2-40,
          ),
        ),
      ),
    );
  }
}
