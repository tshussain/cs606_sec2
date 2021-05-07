import 'dart:core';

import 'package:cs606_sec2/model/PetRecord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'DisplayPetPage.dart';
import 'database/DBHelper.dart';
import 'model/Owner.dart';

class ChoosePetPage extends StatefulWidget {
  Owner _owner;

  ChoosePetPage(this._owner);

  @override
  _ChoosePetPageState createState() => _ChoosePetPageState();
}

class _ChoosePetPageState extends State<ChoosePetPage> {
  PetRecord _selectedItem;

  @override
  Widget build(BuildContext context) {
    String selectedPetName = _selectedItem == null ? "None" : _selectedItem.petName;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Choose Pet Page'),
      ),
      body: Column(
        children: [
          new Container(
            padding: new EdgeInsets.all(16.0),
            child: new FutureBuilder<List<PetRecord>>(
              future: widget._owner == null ? fetchPetRecordsFromDatabase() :
                                   fetchOwnerPetsFromDatabase(widget._owner),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DropdownMenuItem<PetRecord>> menuItems =
                      buildDropDown(snapshot.data);
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: DropdownButton<PetRecord>(
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
          Text("You have chosen pet " + _selectedItem.toString()),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => DisplayPetPage(_selectedItem)));
            }

          )
        ],
      ),
    );
  }
}

Future<List<PetRecord>> fetchPetRecordsFromDatabase() async {
  var dbHelper = DBHelper();
  Future<List<PetRecord>> petRecords = dbHelper.getPetRecords();
  return petRecords;
}



Future<List<PetRecord>> fetchOwnerPetsFromDatabase(Owner owner) async {
  var dbHelper = DBHelper();
  Future<List<PetRecord>> petRecords = dbHelper.getOwnerPets(owner.id);
  return petRecords;
}


/// Create a list of drop-down menu items, one per pet
List<DropdownMenuItem<PetRecord>> buildDropDown(List<PetRecord> petRecords) {
  List<DropdownMenuItem<PetRecord>> items = [];
  for (PetRecord petRecord in petRecords) {
    items.add(DropdownMenuItem(
      child: Text(petRecord.petName),
      value: petRecord,
    ));
  }

  return items;
}
