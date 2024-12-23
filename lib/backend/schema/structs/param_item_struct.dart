// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParamItemStruct extends FFFirebaseStruct {
  ParamItemStruct({
    String? name,
    int? count,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _count = count,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static ParamItemStruct fromMap(Map<String, dynamic> data) => ParamItemStruct(
        name: data['name'] as String?,
        count: castToType<int>(data['count']),
      );

  static ParamItemStruct? maybeFromMap(dynamic data) => data is Map
      ? ParamItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static ParamItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ParamItemStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ParamItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ParamItemStruct &&
        name == other.name &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([name, count]);
}

ParamItemStruct createParamItemStruct({
  String? name,
  int? count,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ParamItemStruct(
      name: name,
      count: count,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ParamItemStruct? updateParamItemStruct(
  ParamItemStruct? paramItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paramItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addParamItemStructData(
  Map<String, dynamic> firestoreData,
  ParamItemStruct? paramItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paramItem == null) {
    return;
  }
  if (paramItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paramItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paramItemData = getParamItemFirestoreData(paramItem, forFieldValue);
  final nestedData = paramItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = paramItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getParamItemFirestoreData(
  ParamItemStruct? paramItem, [
  bool forFieldValue = false,
]) {
  if (paramItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paramItem.toMap());

  // Add any Firestore field values
  paramItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getParamItemListFirestoreData(
  List<ParamItemStruct>? paramItems,
) =>
    paramItems?.map((e) => getParamItemFirestoreData(e, true)).toList() ?? [];
