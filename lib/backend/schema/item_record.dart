import 'dart:async';

import 'package:collection/collection.dart';
import 'package:t_o_p_y_c_h_mobile/backend/schema/structs/item_variant_type_struct.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemRecord extends FirestoreRecord {
  ItemRecord._(
      DocumentReference reference,
      Map<String, dynamic> data,
      ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "category" field.
  DocumentReference? _category;
  DocumentReference? get category => _category;
  bool hasCategory() => _category != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "store" field.
  DocumentReference? _store;
  DocumentReference? get store => _store;
  bool hasStore() => _store != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

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

  // "rates" field.
  List<int>? _rates;
  List<int> get rates => _rates ?? const [];
  bool hasRates() => _rates != null;

  // "buyTimes" field.
  int? _buyTimes;
  int get buyTimes => _buyTimes ?? 0;
  bool hasBuyTimes() => _buyTimes != null;

  // "variants" field.
  List<ItemVariantTypeStruct>? _variants;
  List<ItemVariantTypeStruct> get variants => _variants ?? const [];
  bool hasVariants() => _variants != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _category = snapshotData['category'] as DocumentReference?;
    _images = getDataList(snapshotData['images']);
    _store = snapshotData['store'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _priceDiscounted = castToType<double>(snapshotData['priceDiscounted']);
    _discount = castToType<double>(snapshotData['discount']);
    _rates = getDataList(snapshotData['rates']);
    _buyTimes = castToType<int>(snapshotData['buyTimes']);
    _variants = getStructList(
      snapshotData['variants'],
      ItemVariantTypeStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Item');

  static Stream<ItemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemRecord.fromSnapshot(s));

  static Future<ItemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemRecord.fromSnapshot(s));

  static ItemRecord fromSnapshot(DocumentSnapshot snapshot) => ItemRecord._(
    snapshot.reference,
    mapFromFirestore(snapshot.data() as Map<String, dynamic>),
  );

  static ItemRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      ItemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemRecord &&
          reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemRecordData({
  String? name,
  DocumentReference? category,
  DocumentReference? store,
  String? description,
  double? price,
  double? priceDiscounted,
  double? discount,
  int? buyTimes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'category': category,
      'store': store,
      'description': description,
      'price': price,
      'priceDiscounted': priceDiscounted,
      'discount': discount,
      'buyTimes': buyTimes,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemRecordDocumentEquality implements Equality<ItemRecord> {
  const ItemRecordDocumentEquality();

  @override
  bool equals(ItemRecord? e1, ItemRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.category == e2?.category &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.store == e2?.store &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.priceDiscounted == e2?.priceDiscounted &&
        e1?.discount == e2?.discount &&
        listEquality.equals(e1?.rates, e2?.rates) &&
        e1?.buyTimes == e2?.buyTimes &&
        listEquality.equals(e1?.variants, e2?.variants);
  }

  @override
  int hash(ItemRecord? e) => const ListEquality().hash([
    e?.name,
    e?.category,
    e?.images,
    e?.store,
    e?.description,
    e?.price,
    e?.priceDiscounted,
    e?.discount,
    e?.rates,
    e?.buyTimes,
    e?.variants
  ]);

  @override
  bool isValidKey(Object? o) => o is ItemRecord;
}
