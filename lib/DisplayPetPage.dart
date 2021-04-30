

import 'package:flutter/cupertino.dart';

import 'model/PetRecord.dart';

class DisplayPetPage extends StatelessWidget {
  PetRecord _selectedPet;

  DisplayPetPage(this._selectedPet);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Your chosen pet is " + _selectedPet.petName + " who is " + _selectedPet.petAge.toString() + " old.")
    );
  }
}
