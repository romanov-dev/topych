import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  bool hasDatetime() => _datetime != null;

  // "forUser" field.
  DocumentReference? _forUser;
  DocumentReference? get forUser => _forUser;
  bool hasForUser() => _forUser != null;

  // "dialog" field.
  DocumentReference? _dialog;
  DocumentReference? get dialog => _dialog;
  bool hasDialog() => _dialog != null;

  // "isNew" field.
  bool? _isNew;
  bool get isNew => _isNew ?? false;
  bool hasIsNew() => _isNew != null;

  // "order" field.
  DocumentReference? _order;
  DocumentReference? get order => _order;
  bool hasOrder() => _order != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _text = snapshotData['text'] as String?;
    _datetime = snapshotData['datetime'] as DateTime?;
    _forUser = snapshotData['forUser'] as DocumentReference?;
    _dialog = snapshotData['dialog'] as DocumentReference?;
    _isNew = snapshotData['isNew'] as bool?;
    _order = snapshotData['order'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  String? title,
  String? text,
  DateTime? datetime,
  DocumentReference? forUser,
  DocumentReference? dialog,
  bool? isNew,
  DocumentReference? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'text': text,
      'datetime': datetime,
      'forUser': forUser,
      'dialog': dialog,
      'isNew': isNew,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.text == e2?.text &&
        e1?.datetime == e2?.datetime &&
        e1?.forUser == e2?.forUser &&
        e1?.dialog == e2?.dialog &&
        e1?.isNew == e2?.isNew &&
        e1?.order == e2?.order;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.title,
        e?.text,
        e?.datetime,
        e?.forUser,
        e?.dialog,
        e?.isNew,
        e?.order
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
