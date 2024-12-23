import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "categories" field.
  List<DocumentReference>? _categories;
  List<DocumentReference> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "role" field.
  int? _role;
  int get role => _role ?? 0;
  bool hasRole() => _role != null;

  // "tasks" field.
  List<int>? _tasks;
  List<int> get tasks => _tasks ?? const [];
  bool hasTasks() => _tasks != null;

  // "favorite_items" field.
  List<DocumentReference>? _favoriteItems;
  List<DocumentReference> get favoriteItems => _favoriteItems ?? const [];
  bool hasFavoriteItems() => _favoriteItems != null;

  // "cart_items" field.
  List<CartItemStruct>? _cartItems;
  List<CartItemStruct> get cartItems => _cartItems ?? const [];
  bool hasCartItems() => _cartItems != null;

  // "categoriesUserBuy" field.
  List<DocumentReference>? _categoriesUserBuy;
  List<DocumentReference> get categoriesUserBuy =>
      _categoriesUserBuy ?? const [];
  bool hasCategoriesUserBuy() => _categoriesUserBuy != null;

  // "searchHistory" field.
  List<String>? _searchHistory;
  List<String> get searchHistory => _searchHistory ?? const [];
  bool hasSearchHistory() => _searchHistory != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _categories = getDataList(snapshotData['categories']);
    _status = castToType<int>(snapshotData['status']);
    _role = castToType<int>(snapshotData['role']);
    _tasks = getDataList(snapshotData['tasks']);
    _favoriteItems = getDataList(snapshotData['favorite_items']);
    _cartItems = getStructList(
      snapshotData['cart_items'],
      CartItemStruct.fromMap,
    );
    _categoriesUserBuy = getDataList(snapshotData['categoriesUserBuy']);
    _searchHistory = getDataList(snapshotData['searchHistory']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('User');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? status,
  int? role,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'status': status,
      'role': role,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.categories, e2?.categories) &&
        e1?.status == e2?.status &&
        e1?.role == e2?.role &&
        listEquality.equals(e1?.tasks, e2?.tasks) &&
        listEquality.equals(e1?.favoriteItems, e2?.favoriteItems) &&
        listEquality.equals(e1?.cartItems, e2?.cartItems) &&
        listEquality.equals(e1?.categoriesUserBuy, e2?.categoriesUserBuy) &&
        listEquality.equals(e1?.searchHistory, e2?.searchHistory);
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.categories,
        e?.status,
        e?.role,
        e?.tasks,
        e?.favoriteItems,
        e?.cartItems,
        e?.categoriesUserBuy,
        e?.searchHistory
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
