import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/services/test_service.dart';
import 'package:flutterapp/widgets/navigation_drawer.dart';


class TFAQS extends StatefulWidget {
  @override
  _TFAQSState createState() => _TFAQSState();
}

class _TFAQSState extends State<TFAQS> {
  List faqsList =[];
  //List<FAQSModel> faqsList =[];

  Future<List> getData() async{
    TestService faqsService = new TestService();
    faqsList=await faqsService.getFaqsData();

    print('faqsList');
    print(faqsList);
    return faqsList;
  }


  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    //print(data.size);
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.black,

          title: Text('Frequently Asked Questions'),
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
                    return Card(
                      color: Colors.white12,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ExpansionTile(
                          title: new Text(
                            '\n'+snapshot.data[index].question_np,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                            ),
                          ),
                          // subtitle: new Text(data[i]["answer_np"]),
                          children: <Widget>[
                            Text(
                              '\n'+snapshot.data[index].answer_np,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
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
//import 'dart:async';
//import 'dart:convert';
//
//import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//
//Future<List<Photo>> fetchPhotos(http.Client client) async {
//  final response =
//  await client.get('https://jsonplaceholder.typicode.com/photos');
//
//  // Use the compute function to run parsePhotos in a separate isolate.
//  return compute(parsePhotos, response.body);
//}
//
//// A function that converts a response body into a List<Photo>.
//List<Photo> parsePhotos(String responseBody) {
//  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//
//  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
//}
//
//class Photo {
//  final int albumId;
//  final int id;
//  final String title;
//  final String url;
//  final String thumbnailUrl;
//
//  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});
//
//  factory Photo.fromJson(Map<String, dynamic> json) {
//    return Photo(
//      albumId: json['albumId'] as int,
//      id: json['id'] as int,
//      title: json['title'] as String,
//      url: json['url'] as String,
//      thumbnailUrl: json['thumbnailUrl'] as String,
//    );
//  }
//}
//
//
//
//class TFAQS extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final appTitle = 'Isolate Demo';
//
//    return MaterialApp(
//      title: appTitle,
//      home: MyHomePage(title: appTitle),
//    );
//  }
//}
//
//class MyHomePage extends StatelessWidget {
//  final String title;
//
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(title),
//      ),
//      body: FutureBuilder<List<Photo>>(
//        future: fetchPhotos(http.Client()),
//        builder: (context, snapshot) {
//          if (snapshot.hasError) print(snapshot.error);
//
//          return snapshot.hasData
//              ? PhotosList(photos: snapshot.data)
//              : Center(child: CircularProgressIndicator());
//        },
//      ),
//    );
//  }
//}
//
//class PhotosList extends StatelessWidget {
//  final List<Photo> photos;
//
//  PhotosList({Key key, this.photos}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return GridView.builder(
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 2,
//      ),
//      itemCount: photos.length,
//      itemBuilder: (context, index) {
//        return Image.network(photos[index].thumbnailUrl);
//      },
//    );
//  }
//}