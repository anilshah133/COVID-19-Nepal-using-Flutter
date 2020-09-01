import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/latest_update_model.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutterapp/models/summary_model.dart';

class LatestUpdateService{
  Future<List> getLatestData() async{
    Response response = await (get('https://covid-19.dataflowkit.com/v1/Nepal'));
    var data = jsonDecode(response.body);

    List<LatestUpdateModel> latestUpdateList =[];
    LatestUpdateModel latestUpdateModel = LatestUpdateModel(
        data['Active Cases_text'].toString(),
        data['Last Update'].toString(),
        data['New Cases_text'].toString(),
        data['New Deaths_text'].toString(),
        data['Total Cases_text'].toString(),
        data['Total Deaths_text'].toString(),
        data['Total Recovered_text'].toString()
    );
    latestUpdateList.add(latestUpdateModel);
    for(LatestUpdateModel s in latestUpdateList){

    }

    return latestUpdateList;
  }
}