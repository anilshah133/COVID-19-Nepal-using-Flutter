import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  String textValue = 'Hello World !';
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  new FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    showNotification();

    var android = new AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var platform = new InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(platform);

    firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> msg) {
        print(" onLaunch called ${(msg)}");
      },
      onResume: (Map<String, dynamic> msg) {
        print(" onResume called ${(msg)}");
      },
      onMessage: (Map<String, dynamic> msg) {
        //showNotification(msg);
        print(" onMessage called ${(msg)}");
      },
    );
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, alert: true, badge: true));
    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings setting) {
      print('IOS Setting Registed');
    });
//    firebaseMessaging.getToken().then((token) {
//      update(token);
//    });
  }

  showNotification() async {
    var android = new AndroidNotificationDetails(
      'sdffds dsffds',
      "CHANNLE NAME",
      "channelDescription",
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, "COVID-19 NEPAL", "New Cases alert", platform);
  }

//  update(String token) {
//    print('time to update database');
//    //FirebaseDatabase.instance.reference().child('DeviceTokens');
//    final DatabaseReference databaseReference = new FirebaseDatabase().reference().child('DeviceTokens');
//    databaseReference.push().set({
//      'device_token' : 'testing', 'devicetoken1':'testing1'
//    });
//    textValue = token;
//    setState(() {});
//  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Push Notification'),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Text(
                textValue,
              )
            ],
          ),
        ),
      ),
    );
  }
}


//import 'package:flutterapp/models/message.dart';
//import 'package:flutter/material.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
//
//
//class MessagingWidget extends StatefulWidget {
//  @override
//  _MessagingWidgetState createState() => _MessagingWidgetState();
//}
//
//class _MessagingWidgetState extends State<MessagingWidget> {
//
//  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//  final List<Message> messages = [];
//
//  _getToken() {
//    _firebaseMessaging.getToken().then((token) {
//      print("Device Token: $token");
//    });
//  }
//
//
//
//  @override
//  void initState() {
//    super.initState();
//    _getToken();
//    _firebaseMessaging.configure(
//      onMessage: (Map<String, dynamic> message) async {
//        print("onMessage: $message");
//        final notification = message['notification'];
//        setState(() {
//          messages.add(Message(
//              title: notification['title'], body: notification['body']));
//        });
//      },
//      onLaunch: (Map<String, dynamic> message) async {
//        print("onLaunch: $message");
//
//        final notification = message['data'];
//        setState(() {
//          messages.add(Message(
//            title: '${notification['title']}',
//            body: '${notification['body']}',
//          ));
//        });
//      },
//      onResume: (Map<String, dynamic> message) async {
//        print("onResume: $message");
//      },
//    );
//    _firebaseMessaging.requestNotificationPermissions(
//        const IosNotificationSettings(sound: true, badge: true, alert: true));
//  }
//
//  @override
//  Widget build(BuildContext context) =>
//      ListView(
//        children: messages.map(buildMessage).toList(),
//      );
//
//  Widget buildMessage(Message message) =>
//      ListTile(
//        title: Text(message.title),
//        subtitle: Text(message.body),
//      );
//}
//
