import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BannerRecord extends FirestoreRecord {
  BannerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _video = snapshotData['video'] as String?;
    _status = castToType<int>(snapshotData['status']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Banner');

  static Stream<BannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BannerRecord.fromSnapshot(s));

  static Future<BannerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BannerRecord.fromSnapshot(s));

  static BannerRecord fromSnapshot(DocumentSnapshot snapshot) => BannerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BannerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BannerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BannerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BannerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBannerRecordData({
  String? image,
  String? video,
  int? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'video': video,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class BannerRecordDocumentEquality implements Equality<BannerRecord> {
  const BannerRecordDocumentEquality();

  @override
  bool equals(BannerRecord? e1, BannerRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.video == e2?.video &&
        e1?.status == e2?.status;
  }

  @override
  int hash(BannerRecord? e) =>
      const ListEquality().hash([e?.image, e?.video, e?.status]);

  @override
  bool isValidKey(Object? o) => o is BannerRecord;
}
