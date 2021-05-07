
class Owner {
  int id;
  String name;

  Owner(this.name, this.id);

  Owner.generate(this.name) {
    DateTime now = DateTime.now();
    this.id = now.hashCode;
  }


  @override
  String toString() {
    return 'Owner{id: $id, name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Owner &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}