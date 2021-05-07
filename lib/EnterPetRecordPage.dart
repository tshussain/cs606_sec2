import 'package:cs606_sec2/database/DBHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/Owner.dart';
import 'model/PetRecord.dart';
import 'model/Purchase.dart';

//stful  shortcut to get class started

class EnterPetRecordPage extends StatefulWidget {
  @override
  _EnterPetRecordPageState createState() => _EnterPetRecordPageState();
}

class _EnterPetRecordPageState extends State<EnterPetRecordPage> {
  var _formKey = GlobalKey<FormState>();
  String _petName;
  int _petAge = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pet record entry"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: new InputDecoration(labelText: "Pet Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) => this._petName = value,
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "Pet Age"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a number';
                  } else if (int.tryParse(value) == null) {
                    return "Please enter a valid number";
                  } else if (int.tryParse(value) < 0) {
                    return "Please enter a non-negative number";
                  }
                  return null;
                },
                onSaved: (value) => this._petAge = int.parse(value),
              ),
              ElevatedButton(
                  onPressed: () {
                    _saveForm();
                  },
                  child: Text("Submit"))
            ],
          ),
        )),
      ),
    );
  }

  void _saveForm() async {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      PetRecord petRecord = new PetRecord.generate(_petName, _petAge);

      DBHelper dbHelper = new DBHelper(); // use singleton pattern
      dbHelper.savePetRecord(petRecord);
      print(petRecord);

      /* The rest of this is a temprorary hack to test the join table by populating the owner and purchase tables with data
       */

      PetRecord petRecord2 = PetRecord.generate(_petName+"2", _petAge);
      dbHelper.savePetRecord(petRecord2);
      print(petRecord2);

      Owner owner = Owner.generate("bob");
      dbHelper.saveOwner(owner);
      Purchase purchase = Purchase.generate(petRecord, owner);
      dbHelper.savePurchase(purchase);

      Owner owner2 = Owner.generate("fred");
      dbHelper.saveOwner(owner2);
      Purchase purchase2 = Purchase.generate(petRecord2, owner2);
      dbHelper.savePurchase(purchase2);


      List<PetRecord> results = await dbHelper.getPetRecords();
      print(results.length);
      List<Owner> results2 = await dbHelper.getOwners();
      print(results2.length);
      List<Purchase> results4 = await dbHelper.getPurchases();
      List<PetRecord> results3 = await dbHelper.getOwnerPets(owner.id);
      print(results3.length);





    } else {
      print("Form data not valid.");
    }
  }
}
