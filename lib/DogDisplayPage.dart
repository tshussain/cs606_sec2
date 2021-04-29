


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

import 'DogListPage.dart';
import 'Vehicle.dart';

class DogDisplayPage extends StatefulWidget {
  DogDisplayPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _DogDisplayPageState createState() => _DogDisplayPageState();
}

class _DogDisplayPageState extends State<DogDisplayPage> {
  int _counter = 0;
  var _boxColour = Colors.green;
  String _name = "test";
  bool _visible = true;

  _toggleColour() {
    setState(() {
      if (_boxColour == Colors.green) {
        _boxColour = Colors.blue;
      } else {
        _boxColour = Colors.green;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  // Field
  List<String> _imageNames = [
    "assets/images/pug.jpg",
    "assets/images/lab.jpg",
    "assets/images/pug.jpg",
    "assets/images/lab.jpg"
  ];

  List<Widget> getListOfImageWidgetsFromList(List<String> imageNames) {
    List<Widget> allWidgets = [];

    for (String imageName in imageNames) {
      Widget myWidget = Container(
          height: 100,
          width: 100,
          color: _boxColour,
          child: Image.asset(imageName),
          padding: EdgeInsets.all(10.0));
      allWidgets.add(myWidget);
    }
    return allWidgets;
  }

  Widget _createRowOfImagesFromList(List<String> imageNames) {
    return Row(children: [
      Text("Image Gallery"),
      // Explode list in place using spread operator ... (three dots)
      ...getListOfImageWidgetsFromList(imageNames)
    ]);
  }

  myFunc() {
    List<int> x = [1, 2, 3];
    List<Object> y = [...x, 4];
  }

  Widget _createRowOfImages() {
    return Row(children: [
      Container(
          height: 100,
          width: 100,
          color: _boxColour,
          child: Image.asset("assets/images/pug.jpg"),
          padding: EdgeInsets.all(10.0)),
      Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: Image.asset("assets/images/pug.jpg"),
          padding: EdgeInsets.all(10.0)),
      Container(
          height: 100,
          width: 100,
          color: Colors.orange,
          child: Image.asset("assets/images/lab.jpg"),
          padding: EdgeInsets.all(10.0)),
    ]);
  }

  Widget _createRowOfContainers() {
    return Row(children: [
      Container(height: 100, width: 100, color: _boxColour),
      Container(height: 80, width: 80, color: Colors.red),
      Container(height: 80, width: 80, color: Colors.orange),
    ]);
  }

  Widget _createColumnOfContainers() {
    return Column(children: [
      Container(height: 100, width: 100, color: _boxColour),
      Container(height: 80, width: 80, color: Colors.pink),
      Container(height: 80, width: 80, color: Colors.deepPurple),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    // Vehicle v = Vehicle();
    // TractorTrailer t = TractorTrailer();
    // CustomizedVehicle c = CustomizedVehicle();
    //
    // List<Vehicle> vs = [v, t, c];
    //
    // printList(vs);
    //

    // MixItUp mx = MixItUp();
    // mx.methodA();
    // mx.methodD();
    // classA ca = mx;
    // ca.methodA();
    // // ca.methodD();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DogListPage(_imageNames)));
                  },
                  child: Text("See Dog Page")),
              TextField(
                onSubmitted: (myText) {
                  setState(() {});
                },
              ),
              // Note: Anonymous function (for setState) inside an anonymous function (for onSubmitted/onChanged)...
              TextField(onChanged: (txt) {
                setState(() {
                  _name = txt;
                });
              }),
              Text("Name is " + _name),

              Text("These are my favourite dogs."),
              _createRowOfImagesFromList(_imageNames),
              _createRowOfImages(),
              _createRowOfContainers(),
              _createColumnOfContainers(),
              _createMainRow(),
              Column(children: [
                Text("This is a cool program, eh?"),
                Container(
                  // color: Colors.blue,
                  decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                  height: 200,
                  width: 200,
                  transform: Matrix4.rotationZ(0.45),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(40.0),
                  child: Text(
                    'You have pushed the button this many times:',
                  ),
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ]),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Row _createMainRow() {
    return Row(children: [
      ImageButton(
        children: <Widget>[],
        width: 91,
        height: 36,
        paddingTop: 5,
        pressedImage: Image.asset(
          "assets/images/pug.jpg",
        ),
        unpressedImage: Image.asset("assets/images/lab.jpg"),
        onTap: () {
          _toggleColour();
          print('test');
          setState(() {
            _visible = !_visible;
          });
        },
      ),
      // AnimatedOpacity(
      //   duration: Duration(seconds: 3),
      //   opacity: _visible ? 1.0 : 0.0,
      //   child: Container(
      //     height: 100,
      //     width: 100,
      //     color: _boxColour
      //   )),

      Stack(
          overflow: Overflow.visible,
          alignment: AlignmentDirectional.center,
          children: [
            Container(height: 100, width: 100, color: _boxColour),
            Container(height: 80, width: 80, color: Colors.red),
            Positioned(
              bottom: -10.0,
              right: -10.0,
              child: Container(height: 40, width: 40, color: Colors.green),
            )
          ]),
    ]);
  }

  void printList(List<Vehicle> vs) {
    for (Vehicle vehicle in vs) {
      vehicle.pressHorn();
    }
  }
}
