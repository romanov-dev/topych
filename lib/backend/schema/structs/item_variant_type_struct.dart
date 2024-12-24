// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemVariantTypeStruct extends FFFirebaseStruct {
  ItemVariantTypeStruct({
    List<ParamValueStruct>? paramValues,
    double? price,
    double? priceDiscounted,
    double? discount,
    int? count,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _paramValues = paramValues,
        _price = price,
        _priceDiscounted = priceDiscounted,
        _discount = discount,
        _count = count,
        super(firestoreUtilData);

  // "paramValues" field.
  List<ParamValueStruct>? _paramValues;
  List<ParamValueStruct> get paramValues => _paramValues ?? const [];
  set paramValues(List<ParamValueStruct>? val) => _paramValues = val;

  void updateParamValues(Function(List<ParamValueStruct>) updateFn) {
    updateFn(_paramValues ??= []);
  }

  bool hasParamValues() => _paramValues != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "priceDiscounted" field.
  double? _priceDiscounted;
  double get priceDiscounted => _priceDiscounted ?? 0.0;
  set priceDiscounted(double? val) => _priceDiscounted = val;

  void incrementPriceDiscounted(double amount) =>
      priceDiscounted = priceDiscounted + amount;

  bool hasPriceDiscounted() => _priceDiscounted != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  set discount(double? val) => _discount = val;

  void incrementDiscount(double amount) => discount = discount + amount;

  bool hasDiscount() => _discount != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static ItemVariantTypeStruct fromMap(Map<String, dynamic> data) =>
      ItemVariantTypeStruct(
        paramValues: getStructList(
          data['paramValues'],
          ParamValueStruct.fromMap,
        ),
        price: castToType<double>(data['price']),
        priceDiscounted: castToType<double>(data['priceDiscounted']),
        discount: castToType<double>(data['discount']),
        count: castToType<int>(data['count']),
      );

  static ItemVariantTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemVariantTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'paramValues': _paramValues?.map((e) => e.toMap()).toList(),
        'price': _price,
        'priceDiscounted': _priceDiscounted,
        'discount': _discount,
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'paramValues': serializeParam(
          _paramValues,
          ParamType.DataStruct,
          isList: true,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'priceDiscounted': serializeParam(
          _priceDiscounted,
          ParamType.double,
        ),
        'discount': serializeParam(
          _discount,
          ParamType.double,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static ItemVariantTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemVariantTypeStruct(
        paramValues: deserializeStructParam<ParamValueStruct>(
          data['paramValues'],
          ParamType.DataStruct,
          true,
          structBuilder: ParamValueStruct.fromSerializableMap,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        priceDiscounted: deserializeParam(
          data['priceDiscounted'],
          ParamType.double,
          false,
        ),
        discount: deserializeParam(
          data['discount'],
          ParamType.double,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ItemVariantTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ItemVariantTypeStruct &&
        listEquality.equals(paramValues, other.paramValues) &&
        price == other.price &&
        priceDiscounted == other.priceDiscounted &&
        discount == other.discount &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([paramValues, price, priceDiscounted, discount, count]);
}

ItemVariantTypeStruct createItemVariantTypeStruct({
  double? price,
  double? priceDiscounted,
  double? discount,
  int? count,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemVariantTypeStruct(
      price: price,
      priceDiscounted: priceDiscounted,
      discount: discount,
      count: count,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemVariantTypeStruct? updateItemVariantTypeStruct(
  ItemVariantTypeStruct? itemVariantType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    itemVariantType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemVariantTypeStructData(
  Map<String, dynamic> firestoreData,
  ItemVariantTypeStruct? itemVariantType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (itemVariantType == null) {
    return;
  }
  if (itemVariantType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && itemVariantType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemVariantTypeData =
      getItemVariantTypeFirestoreData(itemVariantType, forFieldValue);
  final nestedData =
      itemVariantTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = itemVariantType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemVariantTypeFirestoreData(
  ItemVariantTypeStruct? itemVariantType, [
  bool forFieldValue = false,
]) {
  if (itemVariantType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(itemVariantType.toMap());

  // Add any Firestore field values
  itemVariantType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemVariantTypeListFirestoreData(
  List<ItemVariantTypeStruct>? itemVariantTypes,
) =>
    itemVariantTypes
        ?.map((e) => getItemVariantTypeFirestoreData(e, true))
        .toList() ??
    [];
