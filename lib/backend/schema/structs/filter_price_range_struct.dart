// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterPriceRangeStruct extends FFFirebaseStruct {
  FilterPriceRangeStruct({
    double? from,
    double? to,
    int? index,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _from = from,
        _to = to,
        _index = index,
        super(firestoreUtilData);

  // "from" field.
  double? _from;
  double get from => _from ?? 0.0;
  set from(double? val) => _from = val;

  void incrementFrom(double amount) => from = from + amount;

  bool hasFrom() => _from != null;

  // "to" field.
  double? _to;
  double get to => _to ?? 0.0;
  set to(double? val) => _to = val;

  void incrementTo(double amount) => to = to + amount;

  bool hasTo() => _to != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;

  void incrementIndex(int amount) => index = index + amount;

  bool hasIndex() => _index != null;

  static FilterPriceRangeStruct fromMap(Map<String, dynamic> data) =>
      FilterPriceRangeStruct(
        from: castToType<double>(data['from']),
        to: castToType<double>(data['to']),
        index: castToType<int>(data['index']),
      );

  static FilterPriceRangeStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterPriceRangeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'from': _from,
        'to': _to,
        'index': _index,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'from': serializeParam(
          _from,
          ParamType.double,
        ),
        'to': serializeParam(
          _to,
          ParamType.double,
        ),
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
      }.withoutNulls;

  static FilterPriceRangeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FilterPriceRangeStruct(
        from: deserializeParam(
          data['from'],
          ParamType.double,
          false,
        ),
        to: deserializeParam(
          data['to'],
          ParamType.double,
          false,
        ),
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'FilterPriceRangeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FilterPriceRangeStruct &&
        from == other.from &&
        to == other.to &&
        index == other.index;
  }

  @override
  int get hashCode => const ListEquality().hash([from, to, index]);
}

FilterPriceRangeStruct createFilterPriceRangeStruct({
  double? from,
  double? to,
  int? index,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FilterPriceRangeStruct(
      from: from,
      to: to,
      index: index,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FilterPriceRangeStruct? updateFilterPriceRangeStruct(
  FilterPriceRangeStruct? filterPriceRange, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    filterPriceRange
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFilterPriceRangeStructData(
  Map<String, dynamic> firestoreData,
  FilterPriceRangeStruct? filterPriceRange,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (filterPriceRange == null) {
    return;
  }
  if (filterPriceRange.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && filterPriceRange.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final filterPriceRangeData =
      getFilterPriceRangeFirestoreData(filterPriceRange, forFieldValue);
  final nestedData =
      filterPriceRangeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = filterPriceRange.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFilterPriceRangeFirestoreData(
  FilterPriceRangeStruct? filterPriceRange, [
  bool forFieldValue = false,
]) {
  if (filterPriceRange == null) {
    return {};
  }
  final firestoreData = mapToFirestore(filterPriceRange.toMap());

  // Add any Firestore field values
  filterPriceRange.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFilterPriceRangeListFirestoreData(
  List<FilterPriceRangeStruct>? filterPriceRanges,
) =>
    filterPriceRanges
        ?.map((e) => getFilterPriceRangeFirestoreData(e, true))
        .toList() ??
    [];
