import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParamValueRecord extends FirestoreRecord {
  ParamValueRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "param" field.
  DocumentReference? _param;
  DocumentReference? get param => _param;
  bool hasParam() => _param != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  void _initializeFields() {
    _param = snapshotData['param'] as DocumentReference?;
    _value = snapshotData['value'] as String?;
    _index = castToType<int>(snapshotData['index']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ParamValue');

  static Stream<ParamValueRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParamValueRecord.fromSnapshot(s));

  static Future<ParamValueRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParamValueRecord.fromSnapshot(s));

  static ParamValueRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParamValueRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParamValueRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParamValueRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParamValueRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParamValueRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParamValueRecordData({
  DocumentReference? param,
  String? value,
  int? index,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'param': param,
      'value': value,
      'index': index,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParamValueRecordDocumentEquality implements Equality<ParamValueRecord> {
  const ParamValueRecordDocumentEquality();

  @override
  bool equals(ParamValueRecord? e1, ParamValueRecord? e2) {
    return e1?.param == e2?.param &&
        e1?.value == e2?.value &&
        e1?.index == e2?.index;
  }

  @override
  int hash(ParamValueRecord? e) =>
      const ListEquality().hash([e?.param, e?.value, e?.index]);

  @override
  bool isValidKey(Object? o) => o is ParamValueRecord;
}
