import 'package:cs606_sec2/AnotherPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ComplicatedCoolGrid.dart';
import 'CoolGrid.dart';
import 'MenuSideBar.dart';

class DogListPage extends StatelessWidget {
  List<String> _imageNames;

  DogListPage(this._imageNames);

  Widget imageTile(String imageName) {
    return Container(
        height: 100,
        width: 100,
        color: Colors.blue,
        child: Image.asset(imageName),
        padding: EdgeInsets.all(10.0));
  }

  List<Widget> getListOfImageWidgetsFromList(List<String> imageNames) {
    List<Widget> allWidgets = [];
    for (String imageName in imageNames) {
      allWidgets.add(imageTile(imageName));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar(
      //   title: Text("Dog List"),
      //   actions: [
      //     IconButton(
      //         icon: Icon(Icons.arrow_back),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         }),
      //     IconButton(
      //         icon: Icon(Icons.navigate_next),
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => MenuSideBar()));
      //         })
      //   ]
      // ),
      body: Column(children: [
        MenuSideBar(),
        _createRowOfImagesFromList(_imageNames)])
    );
  }
}
