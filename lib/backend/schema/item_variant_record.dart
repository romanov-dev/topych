import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemVariantRecord extends FirestoreRecord {
  ItemVariantRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "item" field.
  DocumentReference? _item;
  DocumentReference? get item => _item;
  bool hasItem() => _item != null;

  // "paramValues" field.
  List<ParamValueStruct>? _paramValues;
  List<ParamValueStruct> get paramValues => _paramValues ?? const [];
  bool hasParamValues() => _paramValues != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "priceDiscounted" field.
  double? _priceDiscounted;
  double get priceDiscounted => _priceDiscounted ?? 0.0;
  bool hasPriceDiscounted() => _priceDiscounted != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  bool hasDiscount() => _discount != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  void _initializeFields() {
    _item = snapshotData['item'] as DocumentReference?;
    _paramValues = getStructList(
      snapshotData['paramValues'],
      ParamValueStruct.fromMap,
    );
    _price = castToType<double>(snapshotData['price']);
    _priceDiscounted = castToType<double>(snapshotData['priceDiscounted']);
    _discount = castToType<double>(snapshotData['discount']);
    _count = castToType<int>(snapshotData['count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ItemVariant');

  static Stream<ItemVariantRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemVariantRecord.fromSnapshot(s));

  static Future<ItemVariantRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemVariantRecord.fromSnapshot(s));

  static ItemVariantRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItemVariantRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemVariantRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemVariantRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemVariantRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemVariantRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemVariantRecordData({
  DocumentReference? item,
  double? price,
  double? priceDiscounted,
  double? discount,
  int? count,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'item': item,
      'price': price,
      'priceDiscounted': priceDiscounted,
      'discount': discount,
      'count': count,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemVariantRecordDocumentEquality implements Equality<ItemVariantRecord> {
  const ItemVariantRecordDocumentEquality();

  @override
  bool equals(ItemVariantRecord? e1, ItemVariantRecord? e2) {
    const listEquality = ListEquality();
    return e1?.item == e2?.item &&
        listEquality.equals(e1?.paramValues, e2?.paramValues) &&
        e1?.price == e2?.price &&
        e1?.priceDiscounted == e2?.priceDiscounted &&
        e1?.discount == e2?.discount &&
        e1?.count == e2?.count;
  }

  @override
  int hash(ItemVariantRecord? e) => const ListEquality().hash([
        e?.item,
        e?.paramValues,
        e?.price,
        e?.priceDiscounted,
        e?.discount,
        e?.count
      ]);

  @override
  bool isValidKey(Object? o) => o is ItemVariantRecord;
}
