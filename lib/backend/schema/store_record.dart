import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoreRecord extends FirestoreRecord {
  StoreRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  bool hasCover() => _cover != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  // "accountDeatailsInn" field.
  String? _accountDeatailsInn;
  String get accountDeatailsInn => _accountDeatailsInn ?? '';
  bool hasAccountDeatailsInn() => _accountDeatailsInn != null;

  // "accountDetailsNumber" field.
  String? _accountDetailsNumber;
  String get accountDetailsNumber => _accountDetailsNumber ?? '';
  bool hasAccountDetailsNumber() => _accountDetailsNumber != null;

  // "accountDetailsPhone" field.
  String? _accountDetailsPhone;
  String get accountDetailsPhone => _accountDetailsPhone ?? '';
  bool hasAccountDetailsPhone() => _accountDetailsPhone != null;

  // "accountDetailsEmail" field.
  String? _accountDetailsEmail;
  String get accountDetailsEmail => _accountDetailsEmail ?? '';
  bool hasAccountDetailsEmail() => _accountDetailsEmail != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _cover = snapshotData['cover'] as String?;
    _color = getSchemaColor(snapshotData['color']);
    _accountDeatailsInn = snapshotData['accountDeatailsInn'] as String?;
    _accountDetailsNumber = snapshotData['accountDetailsNumber'] as String?;
    _accountDetailsPhone = snapshotData['accountDetailsPhone'] as String?;
    _accountDetailsEmail = snapshotData['accountDetailsEmail'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Store');

  static Stream<StoreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoreRecord.fromSnapshot(s));

  static Future<StoreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoreRecord.fromSnapshot(s));

  static StoreRecord fromSnapshot(DocumentSnapshot snapshot) => StoreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoreRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoreRecordData({
  String? name,
  String? cover,
  Color? color,
  String? accountDeatailsInn,
  String? accountDetailsNumber,
  String? accountDetailsPhone,
  String? accountDetailsEmail,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'cover': cover,
      'color': color,
      'accountDeatailsInn': accountDeatailsInn,
      'accountDetailsNumber': accountDetailsNumber,
      'accountDetailsPhone': accountDetailsPhone,
      'accountDetailsEmail': accountDetailsEmail,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoreRecordDocumentEquality implements Equality<StoreRecord> {
  const StoreRecordDocumentEquality();

  @override
  bool equals(StoreRecord? e1, StoreRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.cover == e2?.cover &&
        e1?.color == e2?.color &&
        e1?.accountDeatailsInn == e2?.accountDeatailsInn &&
        e1?.accountDetailsNumber == e2?.accountDetailsNumber &&
        e1?.accountDetailsPhone == e2?.accountDetailsPhone &&
        e1?.accountDetailsEmail == e2?.accountDetailsEmail &&
        e1?.description == e2?.description;
  }

  @override
  int hash(StoreRecord? e) => const ListEquality().hash([
        e?.name,
        e?.cover,
        e?.color,
        e?.accountDeatailsInn,
        e?.accountDetailsNumber,
        e?.accountDetailsPhone,
        e?.accountDetailsEmail,
        e?.description
      ]);

  @override
  bool isValidKey(Object? o) => o is StoreRecord;
}
