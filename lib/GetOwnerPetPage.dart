import 'dart:core';

import 'package:cs606_sec2/ChoosePetPage.dart';
import 'package:cs606_sec2/model/PetRecord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'DisplayPetPage.dart';
import 'database/DBHelper.dart';
import 'model/Owner.dart';

class GetOwnerPetPage extends StatefulWidget {
  @override
  _GetOwnerPetPageState createState() => _GetOwnerPetPageState();
}

class _GetOwnerPetPageState extends State<GetOwnerPetPage> {
  Owner _selectedItem;

  @override
  Widget build(BuildContext context) {
    String selectedOwnerName = _selectedItem == null ? "None" : _selectedItem.name;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Get Owner Pet Page'),
      ),
      body: Column(
        children: [
          new Container(
            padding: new EdgeInsets.all(16.0),
            child: new FutureBuilder<List<Owner>>(
              future: fetchOwnersFromDatabase(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DropdownMenuItem<Owner>> menuItems =
                  buildDropDown(snapshot.data);
                  return Container(
                      padding: EdgeInsets.all(10.0),
                      child: DropdownButton<Owner>(
                          value: _selectedItem,
                          items: menuItems,
                          onChanged: (value) {
                            setState(() {
                              _selectedItem = value;
                            });
                          }
                      )
                  );
                } else if (snapshot.data == null) {
                  return new Container(
                    alignment: AlignmentDirectional.center,
                    child: new CircularProgressIndicator(),
                  );
                } else if (snapshot.data.length == 0) {
                  return new Text("No Data found");
                }
                return new Container(
                  alignment: AlignmentDirectional.center,
                  child: new CircularProgressIndicator(),
                );

              },
            ),
          ),
          Text("You have chosen owner " + _selectedItem.toString()),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => ChoosePetPage(_selectedItem)));
              }

          )
        ],
      ),
    );
  }
}

Future<List<Owner>> fetchOwnersFromDatabase() async {
  var dbHelper = DBHelper();
  Future<List<Owner>> owners = dbHelper.getOwners();
  return owners;
}

/// Create a list of drop-down menu items, one per pet
List<DropdownMenuItem<Owner>> buildDropDown(List<Owner> owners) {
  List<DropdownMenuItem<Owner>> items = [];
  for (Owner owner in owners) {
    items.add(DropdownMenuItem(
      child: Text(owner.name),
      value: owner,
    ));
  }

  return items;
}
