import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewRecord extends FirestoreRecord {
  ReviewRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "review" field.
  String? _review;
  String get review => _review ?? '';
  bool hasReview() => _review != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "create_at" field.
  DateTime? _createAt;
  DateTime? get createAt => _createAt;
  bool hasCreateAt() => _createAt != null;

  // "review_for_item" field.
  DocumentReference? _reviewForItem;
  DocumentReference? get reviewForItem => _reviewForItem;
  bool hasReviewForItem() => _reviewForItem != null;

  // "grade" field.
  int? _grade;
  int get grade => _grade ?? 0;
  bool hasGrade() => _grade != null;

  // "reply" field.
  String? _reply;
  String get reply => _reply ?? '';
  bool hasReply() => _reply != null;

  // "isReplied" field.
  bool? _isReplied;
  bool get isReplied => _isReplied ?? false;
  bool hasIsReplied() => _isReplied != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "replyDate" field.
  DateTime? _replyDate;
  DateTime? get replyDate => _replyDate;
  bool hasReplyDate() => _replyDate != null;

  void _initializeFields() {
    _review = snapshotData['review'] as String?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _createAt = snapshotData['create_at'] as DateTime?;
    _reviewForItem = snapshotData['review_for_item'] as DocumentReference?;
    _grade = castToType<int>(snapshotData['grade']);
    _reply = snapshotData['reply'] as String?;
    _isReplied = snapshotData['isReplied'] as bool?;
    _images = getDataList(snapshotData['images']);
    _replyDate = snapshotData['replyDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Review');

  static Stream<ReviewRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewRecord.fromSnapshot(s));

  static Future<ReviewRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewRecord.fromSnapshot(s));

  static ReviewRecord fromSnapshot(DocumentSnapshot snapshot) => ReviewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewRecordData({
  String? review,
  DocumentReference? createBy,
  DateTime? createAt,
  DocumentReference? reviewForItem,
  int? grade,
  String? reply,
  bool? isReplied,
  DateTime? replyDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'review': review,
      'create_by': createBy,
      'create_at': createAt,
      'review_for_item': reviewForItem,
      'grade': grade,
      'reply': reply,
      'isReplied': isReplied,
      'replyDate': replyDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewRecordDocumentEquality implements Equality<ReviewRecord> {
  const ReviewRecordDocumentEquality();

  @override
  bool equals(ReviewRecord? e1, ReviewRecord? e2) {
    const listEquality = ListEquality();
    return e1?.review == e2?.review &&
        e1?.createBy == e2?.createBy &&
        e1?.createAt == e2?.createAt &&
        e1?.reviewForItem == e2?.reviewForItem &&
        e1?.grade == e2?.grade &&
        e1?.reply == e2?.reply &&
        e1?.isReplied == e2?.isReplied &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.replyDate == e2?.replyDate;
  }

  @override
  int hash(ReviewRecord? e) => const ListEquality().hash([
        e?.review,
        e?.createBy,
        e?.createAt,
        e?.reviewForItem,
        e?.grade,
        e?.reply,
        e?.isReplied,
        e?.images,
        e?.replyDate
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewRecord;
}
