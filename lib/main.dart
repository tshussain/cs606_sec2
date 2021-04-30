import 'package:cs606_sec2/DisplayPetRecordsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'AnotherPage.dart';
import 'ChoosePetPage.dart';
import 'DogListPage.dart';
import 'EnterPetRecordPage.dart';
import 'MixItUp.dart';
import 'Vehicle.dart';

void main() {
  runApp(MyApp());
}

class Employee {}

class MyApp extends StatelessWidget {
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ResponsiveGridRow(children: [
                ResponsiveGridCol(
                    xs: 6,
                    md: 12,
                    child: Container(
                      color: Colors.pink,
                      height: 100,
                    )),
                ResponsiveGridCol(
                  xs: 6,
                  md: 12,
                  child: Container(color: Colors.green, height: 100),
                )
              ]),
              ResponsiveGridRow(children: [
                ResponsiveGridCol(
                    md: 6,
                    lg: 3,
                    child: Container(
                      color: Colors.blue,
                      height: 100,
                    )),
                ResponsiveGridCol(
                    md: 6,
                    lg: 3,
                    child: Container(color: Colors.red, height: 100)),
                ResponsiveGridCol(
                    md: 6,
                    lg: 3,
                    child: Container(
                      color: Colors.orange,
                      height: 100,
                    )),
                ResponsiveGridCol(
                    md: 6,
                    lg: 3,
                    child: Container(color: Colors.purple, height: 100))
              ]),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EnterPetRecordPage()));
                  },
                  child: Text("Enter Pet Record")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayPetRecordsPage()));
                  },
                  child: Text("Display Pet Records")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChoosePetPage()));
                  },
                  child: Text("Choose Pet")),
            ],
          ),
        ),
      ),
    );
  }
}
