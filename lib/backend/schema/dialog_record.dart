import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DialogRecord extends FirestoreRecord {
  DialogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lastText" field.
  String? _lastText;
  String get lastText => _lastText ?? '';
  bool hasLastText() => _lastText != null;

  // "lastTextTimeStamp" field.
  DateTime? _lastTextTimeStamp;
  DateTime? get lastTextTimeStamp => _lastTextTimeStamp;
  bool hasLastTextTimeStamp() => _lastTextTimeStamp != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  void _initializeFields() {
    _lastText = snapshotData['lastText'] as String?;
    _lastTextTimeStamp = snapshotData['lastTextTimeStamp'] as DateTime?;
    _users = getDataList(snapshotData['users']);
    _author = snapshotData['author'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Dialog');

  static Stream<DialogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DialogRecord.fromSnapshot(s));

  static Future<DialogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DialogRecord.fromSnapshot(s));

  static DialogRecord fromSnapshot(DocumentSnapshot snapshot) => DialogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DialogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DialogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DialogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DialogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDialogRecordData({
  String? lastText,
  DateTime? lastTextTimeStamp,
  DocumentReference? author,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastText': lastText,
      'lastTextTimeStamp': lastTextTimeStamp,
      'author': author,
    }.withoutNulls,
  );

  return firestoreData;
}

class DialogRecordDocumentEquality implements Equality<DialogRecord> {
  const DialogRecordDocumentEquality();

  @override
  bool equals(DialogRecord? e1, DialogRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lastText == e2?.lastText &&
        e1?.lastTextTimeStamp == e2?.lastTextTimeStamp &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.author == e2?.author;
  }

  @override
  int hash(DialogRecord? e) => const ListEquality()
      .hash([e?.lastText, e?.lastTextTimeStamp, e?.users, e?.author]);

  @override
  bool isValidKey(Object? o) => o is DialogRecord;
}
