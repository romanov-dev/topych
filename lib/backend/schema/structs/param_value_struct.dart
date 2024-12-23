// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParamValueStruct extends FFFirebaseStruct {
  ParamValueStruct({
    DocumentReference? param,
    String? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _param = param,
        _value = value,
        super(firestoreUtilData);

  // "param" field.
  DocumentReference? _param;
  DocumentReference? get param => _param;
  set param(DocumentReference? val) => _param = val;

  bool hasParam() => _param != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  static ParamValueStruct fromMap(Map<String, dynamic> data) =>
      ParamValueStruct(
        param: data['param'] as DocumentReference?,
        value: data['value'] as String?,
      );

  static ParamValueStruct? maybeFromMap(dynamic data) => data is Map
      ? ParamValueStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'param': _param,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'param': serializeParam(
          _param,
          ParamType.DocumentReference,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
      }.withoutNulls;

  static ParamValueStruct fromSerializableMap(Map<String, dynamic> data) =>
      ParamValueStruct(
        param: deserializeParam(
          data['param'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Param'],
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ParamValueStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ParamValueStruct &&
        param == other.param &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([param, value]);
}

ParamValueStruct createParamValueStruct({
  DocumentReference? param,
  String? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ParamValueStruct(
      param: param,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ParamValueStruct? updateParamValueStruct(
  ParamValueStruct? paramValue, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paramValue
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addParamValueStructData(
  Map<String, dynamic> firestoreData,
  ParamValueStruct? paramValue,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paramValue == null) {
    return;
  }
  if (paramValue.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paramValue.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paramValueData = getParamValueFirestoreData(paramValue, forFieldValue);
  final nestedData = paramValueData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = paramValue.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getParamValueFirestoreData(
  ParamValueStruct? paramValue, [
  bool forFieldValue = false,
]) {
  if (paramValue == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paramValue.toMap());

  // Add any Firestore field values
  paramValue.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getParamValueListFirestoreData(
  List<ParamValueStruct>? paramValues,
) =>
    paramValues?.map((e) => getParamValueFirestoreData(e, true)).toList() ?? [];
