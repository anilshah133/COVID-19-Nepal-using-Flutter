import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void navigateToLatestUpdate() {

      Navigator.pushReplacementNamed(context, '/latest_update');

    }

    void navigateToSummary() {

      Navigator.pushReplacementNamed(context, '/summary');

    }
    void navigateToLoading() {

      Navigator.pushReplacementNamed(context, '/loading');

    }
    void navigateToFAQS() {

      Navigator.pushReplacementNamed(context, '/faqs');

    }

    void navigateToNews() {

      Navigator.pushReplacementNamed(context, '/news');

    }

    void navigateToTest() {

      Navigator.pushReplacementNamed(context, '/test');

    }

    return Drawer(
      elevation: 16.0,

      child: Container(
        color: Colors.blueGrey[200],
        child: Column(

          children: <Widget>[
            SafeArea(
              child: Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'COVID-19 NEPAL INFO',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                height:50,
                width: 300,
              ),
            ),
            ListTile(
              title: new Text("Latest Update",
                style: TextStyle(fontSize: 16),),
              leading: new Icon(Icons.info),
              onTap: (
                  navigateToLatestUpdate
              ),

            ),
            Divider(
              height: 0.1,
              color: Colors.black,
            ),
            ListTile(
              title: new Text("Summary",
                style: TextStyle(fontSize: 16),
              ),
              leading: new Icon(Icons.info),
              onTap: (

                  navigateToSummary
              ),
            ),
            Divider(
              height: 0.1,
              color: Colors.black,
            ),
            ListTile(
              title: new Text("News",
                style: TextStyle(fontSize: 16),),
              leading: new Icon(Icons.info),
              onTap: navigateToNews,

            ),
            Divider(
              height: 0.1,
              color: Colors.black,
            ),
            ListTile(
              title: new Text("Informations",
                style: TextStyle(fontSize: 16),),
              leading: new Icon(Icons.info),

//              onTap: (
//                  navigateToLatestUpdate
//              ),

            ),
            Divider(
              height: 0.1,
              color: Colors.black,
            ),
            ListTile(
              title: new Text("Test",
                style: TextStyle(fontSize: 16),),
              leading: new Icon(Icons.info),

              onTap: (
                navigateToTest
            ),

            ),
            Divider(
              height: 0.1,
              color: Colors.black,
            ),
            ListTile(
              title: new Text("FAQS",
                style: TextStyle(fontSize: 16),),
              leading: new Icon(Icons.info),

              onTap: (
                  navigateToFAQS
              ),

            )
          ],
        ),
      ),
    );
  }
}
