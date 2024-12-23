import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "dialog" field.
  DocumentReference? _dialog;
  DocumentReference? get dialog => _dialog;
  bool hasDialog() => _dialog != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _author = snapshotData['author'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _dialog = snapshotData['dialog'] as DocumentReference?;
    _images = getDataList(snapshotData['images']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Message');

  static Stream<MessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageRecord.fromSnapshot(s));

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageRecord.fromSnapshot(s));

  static MessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageRecordData({
  String? text,
  DocumentReference? author,
  DateTime? timestamp,
  DocumentReference? dialog,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'author': author,
      'timestamp': timestamp,
      'dialog': dialog,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    const listEquality = ListEquality();
    return e1?.text == e2?.text &&
        e1?.author == e2?.author &&
        e1?.timestamp == e2?.timestamp &&
        e1?.dialog == e2?.dialog &&
        listEquality.equals(e1?.images, e2?.images);
  }

  @override
  int hash(MessageRecord? e) => const ListEquality()
      .hash([e?.text, e?.author, e?.timestamp, e?.dialog, e?.images]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
