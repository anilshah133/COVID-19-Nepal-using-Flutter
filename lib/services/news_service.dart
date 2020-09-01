import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/faqs_model.dart';
import 'package:flutterapp/models/latest_update_model.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutterapp/models/news_model.dart';

class NewsService{
  List data;
  List<NewsModel> newslist =new List<NewsModel>();

  Future<List> getNewsData() async{
    Response response = await (get('https://nepalcorona.info/api/v1/news'));

    var extractDAta = jsonDecode(response.body);
    data=extractDAta['data'];


    for(int i=0;i<data.length;i++){
      print(data.length);
      print(i);
      NewsModel newsModel= new NewsModel(
          data[i]['_id'].toString(),
          data[i]['title'].toString(),
          data[i]['summary'].toString(),
          data[i]['updated_at'].toString(),
          data[i]['image_url'].toString()
      );
      try {
        print(newsModel);
        newslist.add(newsModel);
      } on Exception catch(_){
        print(Exception);
      }

    }
    return newslist;
  }
}