import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  List<String> _imageNames;

  AnotherPage(this._imageNames);

  Widget imageTile(String imageName) {
    return Container(
        height: 100,
        width: 100,
        color: Colors.blue,
        child: Image.asset(imageName),
        padding: EdgeInsets.all(10.0));
  }

  /// Use ListView builder pattern to create a View containing all the images in the given list
  getListViewOfImageWidgets(List<String> imageNames) {
    return ListView.builder(
      itemCount: imageNames.length,
      itemBuilder: (context, index) {
        return imageTile(imageNames[index]);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Another Dog List"),
            actions: [
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]
        ),
        body: getListViewOfImageWidgets(_imageNames)
    );
  }
}
