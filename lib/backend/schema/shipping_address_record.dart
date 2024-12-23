import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShippingAddressRecord extends FirestoreRecord {
  ShippingAddressRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "deliveryCity" field.
  String? _deliveryCity;
  String get deliveryCity => _deliveryCity ?? '';
  bool hasDeliveryCity() => _deliveryCity != null;

  // "deliveryStreet" field.
  String? _deliveryStreet;
  String get deliveryStreet => _deliveryStreet ?? '';
  bool hasDeliveryStreet() => _deliveryStreet != null;

  // "deliveryIndex" field.
  String? _deliveryIndex;
  String get deliveryIndex => _deliveryIndex ?? '';
  bool hasDeliveryIndex() => _deliveryIndex != null;

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  bool hasContact() => _contact != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _deliveryCity = snapshotData['deliveryCity'] as String?;
    _deliveryStreet = snapshotData['deliveryStreet'] as String?;
    _deliveryIndex = snapshotData['deliveryIndex'] as String?;
    _contact = snapshotData['contact'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ShippingAddress');

  static Stream<ShippingAddressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShippingAddressRecord.fromSnapshot(s));

  static Future<ShippingAddressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShippingAddressRecord.fromSnapshot(s));

  static ShippingAddressRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShippingAddressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShippingAddressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShippingAddressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShippingAddressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShippingAddressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShippingAddressRecordData({
  DocumentReference? user,
  String? name,
  String? deliveryCity,
  String? deliveryStreet,
  String? deliveryIndex,
  String? contact,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'name': name,
      'deliveryCity': deliveryCity,
      'deliveryStreet': deliveryStreet,
      'deliveryIndex': deliveryIndex,
      'contact': contact,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShippingAddressRecordDocumentEquality
    implements Equality<ShippingAddressRecord> {
  const ShippingAddressRecordDocumentEquality();

  @override
  bool equals(ShippingAddressRecord? e1, ShippingAddressRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.name == e2?.name &&
        e1?.deliveryCity == e2?.deliveryCity &&
        e1?.deliveryStreet == e2?.deliveryStreet &&
        e1?.deliveryIndex == e2?.deliveryIndex &&
        e1?.contact == e2?.contact;
  }

  @override
  int hash(ShippingAddressRecord? e) => const ListEquality().hash([
        e?.user,
        e?.name,
        e?.deliveryCity,
        e?.deliveryStreet,
        e?.deliveryIndex,
        e?.contact
      ]);

  @override
  bool isValidKey(Object? o) => o is ShippingAddressRecord;
}
