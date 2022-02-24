import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Bot(),
    );
  }
}

class Bot extends StatefulWidget {
  const Bot({Key? key}) : super(key: key);

  @override
  _BotState createState() => _BotState();
}

class _BotState extends State<Bot> {
  Future<void> bot() async{
    try {
      dynamic conversationObject = {
        'appId': '39c0b825b2aca7f0692bd02fc2867eee8'
      };
      dynamic result = await KommunicateFlutterPlugin.buildConversation(conversationObject);
      print("Conversation builder success : " + result.toString());
    } on Exception catch (e) {
      print("Conversation builder error occurred : " + e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(onPressed: (){
              bot();
            }, child: Icon(Icons.add)),
          ),
        ],
      ),
    );
  }
}
