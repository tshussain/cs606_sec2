

class PetRecord {
  String _petName;
  int _petAge;

  PetRecord(this._petName, this._petAge);

  String get petName => _petName;

  set petName(String value) {
    _petName = value;
  }

  int get petAge => _petAge;

  set petAge(int value) {
    _petAge = value;
  }

  @override
  String toString() {
    return 'PetRecord{_petName: $_petName, _petAge: $_petAge}';
  }
}