

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

  /// Need to add == so that DropdownButton will be able to use
  ///  PetRecord properly.
  ///  (Note:  Use the IDE to automatically generate this method.)
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PetRecord &&
          runtimeType == other.runtimeType &&
          _petName == other._petName &&
          _petAge == other._petAge;

  @override
  int get hashCode => _petName.hashCode ^ _petAge.hashCode;
}