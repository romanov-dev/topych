import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "customer" field.
  DocumentReference? _customer;
  DocumentReference? get customer => _customer;
  bool hasCustomer() => _customer != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "retur_type" field.
  int? _returType;
  int get returType => _returType ?? 0;
  bool hasReturType() => _returType != null;

  // "return_status" field.
  int? _returnStatus;
  int get returnStatus => _returnStatus ?? 0;
  bool hasReturnStatus() => _returnStatus != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "paymentId" field.
  String? _paymentId;
  String get paymentId => _paymentId ?? '';
  bool hasPaymentId() => _paymentId != null;

  // "paid" field.
  bool? _paid;
  bool get paid => _paid ?? false;
  bool hasPaid() => _paid != null;

  // "itemsVariants" field.
  List<DocumentReference>? _itemsVariants;
  List<DocumentReference> get itemsVariants => _itemsVariants ?? const [];
  bool hasItemsVariants() => _itemsVariants != null;

  void _initializeFields() {
    _customer = snapshotData['customer'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _returType = castToType<int>(snapshotData['retur_type']);
    _returnStatus = castToType<int>(snapshotData['return_status']);
    _dateTime = snapshotData['dateTime'] as DateTime?;
    _price = castToType<double>(snapshotData['price']);
    _address = snapshotData['address'] as String?;
    _paymentId = snapshotData['paymentId'] as String?;
    _paid = snapshotData['paid'] as bool?;
    _itemsVariants = getDataList(snapshotData['itemsVariants']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  DocumentReference? customer,
  int? status,
  int? returType,
  int? returnStatus,
  DateTime? dateTime,
  double? price,
  String? address,
  String? paymentId,
  bool? paid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customer': customer,
      'status': status,
      'retur_type': returType,
      'return_status': returnStatus,
      'dateTime': dateTime,
      'price': price,
      'address': address,
      'paymentId': paymentId,
      'paid': paid,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.customer == e2?.customer &&
        e1?.status == e2?.status &&
        e1?.returType == e2?.returType &&
        e1?.returnStatus == e2?.returnStatus &&
        e1?.dateTime == e2?.dateTime &&
        e1?.price == e2?.price &&
        e1?.address == e2?.address &&
        e1?.paymentId == e2?.paymentId &&
        e1?.paid == e2?.paid &&
        listEquality.equals(e1?.itemsVariants, e2?.itemsVariants);
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash([
        e?.customer,
        e?.status,
        e?.returType,
        e?.returnStatus,
        e?.dateTime,
        e?.price,
        e?.address,
        e?.paymentId,
        e?.paid,
        e?.itemsVariants
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
