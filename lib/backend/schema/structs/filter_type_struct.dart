// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterTypeStruct extends FFFirebaseStruct {
  FilterTypeStruct({
    DocumentReference? category,
    double? priceFrom,
    double? priceTo,
    double? priceMin,
    double? priceMax,
    FilterPriceRangeStruct? priceRange,
    List<ParamValueStruct>? values,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _category = category,
        _priceFrom = priceFrom,
        _priceTo = priceTo,
        _priceMin = priceMin,
        _priceMax = priceMax,
        _priceRange = priceRange,
        _values = values,
        super(firestoreUtilData);

  // "category" field.
  DocumentReference? _category;
  DocumentReference? get category => _category;
  set category(DocumentReference? val) => _category = val;

  bool hasCategory() => _category != null;

  // "priceFrom" field.
  double? _priceFrom;
  double get priceFrom => _priceFrom ?? 0.0;
  set priceFrom(double? val) => _priceFrom = val;

  void incrementPriceFrom(double amount) => priceFrom = priceFrom + amount;

  bool hasPriceFrom() => _priceFrom != null;

  // "priceTo" field.
  double? _priceTo;
  double get priceTo => _priceTo ?? 0.0;
  set priceTo(double? val) => _priceTo = val;

  void incrementPriceTo(double amount) => priceTo = priceTo + amount;

  bool hasPriceTo() => _priceTo != null;

  // "priceMin" field.
  double? _priceMin;
  double get priceMin => _priceMin ?? 0.0;
  set priceMin(double? val) => _priceMin = val;

  void incrementPriceMin(double amount) => priceMin = priceMin + amount;

  bool hasPriceMin() => _priceMin != null;

  // "priceMax" field.
  double? _priceMax;
  double get priceMax => _priceMax ?? 0.0;
  set priceMax(double? val) => _priceMax = val;

  void incrementPriceMax(double amount) => priceMax = priceMax + amount;

  bool hasPriceMax() => _priceMax != null;

  // "priceRange" field.
  FilterPriceRangeStruct? _priceRange;
  FilterPriceRangeStruct get priceRange =>
      _priceRange ?? FilterPriceRangeStruct();
  set priceRange(FilterPriceRangeStruct? val) => _priceRange = val;

  void updatePriceRange(Function(FilterPriceRangeStruct) updateFn) {
    updateFn(_priceRange ??= FilterPriceRangeStruct());
  }

  bool hasPriceRange() => _priceRange != null;

  // "values" field.
  List<ParamValueStruct>? _values;
  List<ParamValueStruct> get values => _values ?? const [];
  set values(List<ParamValueStruct>? val) => _values = val;

  void updateValues(Function(List<ParamValueStruct>) updateFn) {
    updateFn(_values ??= []);
  }

  bool hasValues() => _values != null;

  static FilterTypeStruct fromMap(Map<String, dynamic> data) =>
      FilterTypeStruct(
        category: data['category'] as DocumentReference?,
        priceFrom: castToType<double>(data['priceFrom']),
        priceTo: castToType<double>(data['priceTo']),
        priceMin: castToType<double>(data['priceMin']),
        priceMax: castToType<double>(data['priceMax']),
        priceRange: data['priceRange'] is FilterPriceRangeStruct
            ? data['priceRange']
            : FilterPriceRangeStruct.maybeFromMap(data['priceRange']),
        values: getStructList(
          data['values'],
          ParamValueStruct.fromMap,
        ),
      );

  static FilterTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'category': _category,
        'priceFrom': _priceFrom,
        'priceTo': _priceTo,
        'priceMin': _priceMin,
        'priceMax': _priceMax,
        'priceRange': _priceRange?.toMap(),
        'values': _values?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category': serializeParam(
          _category,
          ParamType.DocumentReference,
        ),
        'priceFrom': serializeParam(
          _priceFrom,
          ParamType.double,
        ),
        'priceTo': serializeParam(
          _priceTo,
          ParamType.double,
        ),
        'priceMin': serializeParam(
          _priceMin,
          ParamType.double,
        ),
        'priceMax': serializeParam(
          _priceMax,
          ParamType.double,
        ),
        'priceRange': serializeParam(
          _priceRange,
          ParamType.DataStruct,
        ),
        'values': serializeParam(
          _values,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static FilterTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      FilterTypeStruct(
        category: deserializeParam(
          data['category'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Category'],
        ),
        priceFrom: deserializeParam(
          data['priceFrom'],
          ParamType.double,
          false,
        ),
        priceTo: deserializeParam(
          data['priceTo'],
          ParamType.double,
          false,
        ),
        priceMin: deserializeParam(
          data['priceMin'],
          ParamType.double,
          false,
        ),
        priceMax: deserializeParam(
          data['priceMax'],
          ParamType.double,
          false,
        ),
        priceRange: deserializeStructParam(
          data['priceRange'],
          ParamType.DataStruct,
          false,
          structBuilder: FilterPriceRangeStruct.fromSerializableMap,
        ),
        values: deserializeStructParam<ParamValueStruct>(
          data['values'],
          ParamType.DataStruct,
          true,
          structBuilder: ParamValueStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FilterTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FilterTypeStruct &&
        category == other.category &&
        priceFrom == other.priceFrom &&
        priceTo == other.priceTo &&
        priceMin == other.priceMin &&
        priceMax == other.priceMax &&
        priceRange == other.priceRange &&
        listEquality.equals(values, other.values);
  }

  @override
  int get hashCode => const ListEquality().hash(
      [category, priceFrom, priceTo, priceMin, priceMax, priceRange, values]);
}

FilterTypeStruct createFilterTypeStruct({
  DocumentReference? category,
  double? priceFrom,
  double? priceTo,
  double? priceMin,
  double? priceMax,
  FilterPriceRangeStruct? priceRange,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FilterTypeStruct(
      category: category,
      priceFrom: priceFrom,
      priceTo: priceTo,
      priceMin: priceMin,
      priceMax: priceMax,
      priceRange:
          priceRange ?? (clearUnsetFields ? FilterPriceRangeStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FilterTypeStruct? updateFilterTypeStruct(
  FilterTypeStruct? filterType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    filterType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFilterTypeStructData(
  Map<String, dynamic> firestoreData,
  FilterTypeStruct? filterType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (filterType == null) {
    return;
  }
  if (filterType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && filterType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final filterTypeData = getFilterTypeFirestoreData(filterType, forFieldValue);
  final nestedData = filterTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = filterType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFilterTypeFirestoreData(
  FilterTypeStruct? filterType, [
  bool forFieldValue = false,
]) {
  if (filterType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(filterType.toMap());

  // Handle nested data for "priceRange" field.
  addFilterPriceRangeStructData(
    firestoreData,
    filterType.hasPriceRange() ? filterType.priceRange : null,
    'priceRange',
    forFieldValue,
  );

  // Add any Firestore field values
  filterType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFilterTypeListFirestoreData(
  List<FilterTypeStruct>? filterTypes,
) =>
    filterTypes?.map((e) => getFilterTypeFirestoreData(e, true)).toList() ?? [];
