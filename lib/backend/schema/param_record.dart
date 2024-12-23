import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParamRecord extends FirestoreRecord {
  ParamRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Param');

  static Stream<ParamRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParamRecord.fromSnapshot(s));

  static Future<ParamRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParamRecord.fromSnapshot(s));

  static ParamRecord fromSnapshot(DocumentSnapshot snapshot) => ParamRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParamRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParamRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParamRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParamRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParamRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParamRecordDocumentEquality implements Equality<ParamRecord> {
  const ParamRecordDocumentEquality();

  @override
  bool equals(ParamRecord? e1, ParamRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(ParamRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is ParamRecord;
}
