import 'package:flutter/material.dart';
import 'package:flutter_web_audio_player/flutter_web_audio_player.dart';
import 'package:webapp/appbar.dart';
import 'package:webapp/landingpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(125, 20, 15, 1),
                Color.fromRGBO(36, 11, 54, 1)
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MyyAppBar(),
              LandingPage(),
              Container(
                width: 600,
                height: 100,
                child: WebAudioPlayer(
                  src:
                      'https://drive.google.com/uc?id=1gYbn-5kuxPiJ-X1Y8GxDxFHfdxlRpZn6&export=download',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
