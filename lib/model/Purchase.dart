


import 'Owner.dart';
import 'PetRecord.dart';

class Purchase {
  int transactionId;
  PetRecord petRecord;
  Owner owner;

  Purchase(this.transactionId, this.petRecord, this.owner);

  Purchase.generate(this.petRecord, this.owner)  {
    DateTime now = DateTime.now();
    this.transactionId = now.hashCode;
  }


  @override
  String toString() {
    return 'Purchase{transactionId: $transactionId, petRecord: $petRecord, owner: $owner}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Purchase &&
          runtimeType == other.runtimeType &&
          transactionId == other.transactionId &&
          petRecord == other.petRecord &&
          owner == other.owner;

  @override
  int get hashCode =>
      transactionId.hashCode ^ petRecord.hashCode ^ owner.hashCode;
}