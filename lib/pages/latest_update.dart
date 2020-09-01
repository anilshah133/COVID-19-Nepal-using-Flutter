import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/navigation_drawer.dart';
import 'package:flutterapp/widgets/square_data_box.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutterapp/services/latest_update_service.dart';
import 'package:flutterapp/models/latest_update_model.dart';

class LatestUpdate extends StatefulWidget {
  @override
  _LatestUpdateState createState() => _LatestUpdateState();
}

class _LatestUpdateState extends State<LatestUpdate> {

  List<LatestUpdateModel> latestUpdateList =[];

  Future<List> getData() async{

    LatestUpdateService latestUpdateService = new LatestUpdateService() ;

    latestUpdateList=await latestUpdateService.getLatestData();


    return latestUpdateList;
  }
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    print(data.size);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black,

        title: Text('COVID-19 NEPAL LATEST UPDATE'),
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
                                SquareDataBox('New Cases',snapshot.data[index].newCases
                                ),
                                SquareDataBox('New Deaths',snapshot.data[index].newDeaths
                                ),
                              ]
                          ),
                          Row(
                              children: <Widget>[
                                SquareDataBox('Active Cases',snapshot.data[index].activeCases
                                ),
                                SquareDataBox('Total Cases',snapshot.data[index].totalCase
                                ),


                              ]
                          ),
                          Row(
                              children: <Widget>[
                                SquareDataBox('Total Deaths',snapshot.data[index].totalDeaths
                                ),
                                SquareDataBox('Total Recovered',snapshot.data[index].totalRecovered
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

      drawer: NavBar()
    );
  }
}
