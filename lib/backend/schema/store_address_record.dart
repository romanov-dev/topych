import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoreAddressRecord extends FirestoreRecord {
  StoreAddressRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "store" field.
  DocumentReference? _store;
  DocumentReference? get store => _store;
  bool hasStore() => _store != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "addressPlaceId" field.
  String? _addressPlaceId;
  String get addressPlaceId => _addressPlaceId ?? '';
  bool hasAddressPlaceId() => _addressPlaceId != null;

  // "contactName" field.
  String? _contactName;
  String get contactName => _contactName ?? '';
  bool hasContactName() => _contactName != null;

  // "contactPhone" field.
  String? _contactPhone;
  String get contactPhone => _contactPhone ?? '';
  bool hasContactPhone() => _contactPhone != null;

  // "isMain" field.
  bool? _isMain;
  bool get isMain => _isMain ?? false;
  bool hasIsMain() => _isMain != null;

  void _initializeFields() {
    _store = snapshotData['store'] as DocumentReference?;
    _address = snapshotData['address'] as String?;
    _addressPlaceId = snapshotData['addressPlaceId'] as String?;
    _contactName = snapshotData['contactName'] as String?;
    _contactPhone = snapshotData['contactPhone'] as String?;
    _isMain = snapshotData['isMain'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('StoreAddress');

  static Stream<StoreAddressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoreAddressRecord.fromSnapshot(s));

  static Future<StoreAddressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoreAddressRecord.fromSnapshot(s));

  static StoreAddressRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StoreAddressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoreAddressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoreAddressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoreAddressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoreAddressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoreAddressRecordData({
  DocumentReference? store,
  String? address,
  String? addressPlaceId,
  String? contactName,
  String? contactPhone,
  bool? isMain,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'store': store,
      'address': address,
      'addressPlaceId': addressPlaceId,
      'contactName': contactName,
      'contactPhone': contactPhone,
      'isMain': isMain,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoreAddressRecordDocumentEquality
    implements Equality<StoreAddressRecord> {
  const StoreAddressRecordDocumentEquality();

  @override
  bool equals(StoreAddressRecord? e1, StoreAddressRecord? e2) {
    return e1?.store == e2?.store &&
        e1?.address == e2?.address &&
        e1?.addressPlaceId == e2?.addressPlaceId &&
        e1?.contactName == e2?.contactName &&
        e1?.contactPhone == e2?.contactPhone &&
        e1?.isMain == e2?.isMain;
  }

  @override
  int hash(StoreAddressRecord? e) => const ListEquality().hash([
        e?.store,
        e?.address,
        e?.addressPlaceId,
        e?.contactName,
        e?.contactPhone,
        e?.isMain
      ]);

  @override
  bool isValidKey(Object? o) => o is StoreAddressRecord;
}
