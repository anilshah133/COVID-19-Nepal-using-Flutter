import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/pages/loading.dart';
import 'package:flutterapp/pages/latest_update.dart';
import 'package:flutterapp/pages/summary.dart';
import 'package:flutterapp/pages/faqs.dart';
import 'package:flutterapp/pages/testpage.dart';
import 'package:flutterapp/pages/widget_test.dart';
import 'package:flutterapp/pages/news.dart';
import 'dart:convert';
import 'dart:async';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

//this is the name given to the background fetch
const simplePeriodicTask = "simplePeriodicTask";

// flutter local notification setup
void showNotification( v, flp) async {
  var android = AndroidNotificationDetails(
      'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
      priority: Priority.High, importance: Importance.Max);
  var iOS = IOSNotificationDetails();
  var platform = NotificationDetails(android, iOS);
  await flp.show(0, 'NEW CASE ALERT', '$v', platform,
      payload: 'VIS \n $v');
}

int caseCounter=0;

//Loading counter value on start
_loadPositiveCaseCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
 caseCounter = (prefs.getInt('counter') ?? 0);
  //print('loadstate counter is');
  print(caseCounter);

}

//Incrementing counter after click
_incrementPositiveCaseCounter(int caseCount) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', caseCount);

}

//main function
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager.initialize(callbackDispatcher, isInDebugMode: false); //to true if still in testing lev turn it to false whenever you are launching the app
  await Workmanager.registerPeriodicTask("5", simplePeriodicTask,
      existingWorkPolicy: ExistingWorkPolicy.replace,
      frequency: Duration(minutes: 15),//when should it check the link
      initialDelay: Duration(seconds: 5),//duration before showing the notification
      constraints: Constraints(
        networkType: NetworkType.connected,
      ));
  runApp(MaterialApp(
    initialRoute: '/test',
    routes:{
      '/': (context) => LatestUpdate(),
      '/loading': (context) => Loading(),
      '/home': (context) => Home(),
      '/latest_update': (context) => LatestUpdate(),
      '/summary': (context) => Summary(),
      '/faqs': (context) => FAQS(),
      '/test': (context) => TFAQS(),
      '/testwidget': (context) => TileApp(),
      '/news': (context) => News(),
    },
  ));
}

//runs in background in every 15 seconds
void callbackDispatcher() {
  Workmanager.executeTask((task, inputData) async {

    FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = IOSInitializationSettings();
    var initSetttings = InitializationSettings(android, iOS);
    flp.initialize(initSetttings);
try {
  Response response = await (get('https://nepalcorona.info/api/v1/data/nepal'));
  var data = jsonDecode(response.body);
  int total_positive_cases = data['tested_positive'];
  await _loadPositiveCaseCounter();

  if ((total_positive_cases != caseCounter) &&(total_positive_cases!=null) && (total_positive_cases!=0)) {

    Response newCaseResponse = await (get(
        'https://covid-19.dataflowkit.com/v1/Nepal'));
    var newCaseData = jsonDecode(newCaseResponse.body);
    String newCaseCount = newCaseData['New Cases_text'].toString();
    String newDeathCount = newCaseData['New Deaths_text'].toString();

    if (newCaseCount != "" || newCaseCount != null) {
      await _incrementPositiveCaseCounter(total_positive_cases);
      showNotification(
          'New Cases :' + newCaseCount + ' , New Death : ' + newDeathCount, flp);
    }

  }
}on Exception catch (_){

    }


    return Future.value(true);
  });
}






