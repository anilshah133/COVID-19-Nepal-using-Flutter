import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutterapp/services/summary_service.dart';
import 'package:flutterapp/models/summary_model.dart';
import 'package:flutterapp/widgets/navigation_drawer.dart';
import 'package:flutterapp/widgets/square_data_box.dart';

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  List<SummaryModel> summaryList =[];


  Future<List> getData() async{

    SummaryService summ = new SummaryService() ;

    summaryList=await summ.getSummaryData();

//    setState(() {
//      testedPve=summ.tested_positive;
//
//    });

    return summaryList;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  // getData();
  }


  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.black,

        title: Text('COVID-19 NEPAL SUMMARY'),
    ),
    body: Container(
      child: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.data==null){
            return Container(
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
            );
          }
          else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Row(
                            children: <Widget>[
                              SquareDataBox('Tested Positive',snapshot.data[index].tested_positive
                              ),
                              SquareDataBox('Tested Negative',snapshot.data[index].tested_negative
                              ),
                            ]
                        ),
                        Row(
                            children: <Widget>[
                              SquareDataBox('Tested Total',snapshot.data[index].tested_total
                              ),
                              SquareDataBox('Deaths',snapshot.data[index].deaths
                              ),


                            ]
                        ),
                        Row(
                            children: <Widget>[
                              SquareDataBox('Recovered',snapshot.data[index].recovered
                              ),
                              SquareDataBox('Quarantined',snapshot.data[index].quarantined
                              ),
                            ]
                        ),
                        Row(
                            children: <Widget>[
                              SquareDataBox('In Isolation',snapshot.data[index].in_isolation
                              ),
                              SquareDataBox('RDT Test',snapshot.data[index].tested_rdt
                              ),
                            ]
                        ),


                  

                      ],
                    ),
                  ),


                );
              },
            );
          }


        },
      ),

    ),

      drawer: NavBar(),
    );
  }
}
