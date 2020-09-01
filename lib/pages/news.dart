import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/services/news_service.dart';
import 'package:flutterapp/widgets/navigation_drawer.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {

  List newsList =[];
  //List<FAQSModel> faqsList =[];

  Future<List> getData() async{

    NewsService newsService = new NewsService();
    newsList=await newsService.getNewsData();
    print('newsList');
    print(newsList);
    return newsList;
  }


  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    print(data.size);
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
                            '\n'+snapshot.data[index].title,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                            ),
                          ),
                          // subtitle: new Text(data[i]["answer_np"]),
                          children: <Widget>[
                            Text(
                              '\n'+snapshot.data[index].summary+'\n'+snapshot.data[index].date,
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
