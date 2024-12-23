// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderStatusStruct extends FFFirebaseStruct {
  OrderStatusStruct({
    int? status,
    DateTime? dateTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _dateTime = dateTime,
        super(firestoreUtilData);

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;

  void incrementStatus(int amount) => status = status + amount;

  bool hasStatus() => _status != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? val) => _dateTime = val;

  bool hasDateTime() => _dateTime != null;

  static OrderStatusStruct fromMap(Map<String, dynamic> data) =>
      OrderStatusStruct(
        status: castToType<int>(data['status']),
        dateTime: data['dateTime'] as DateTime?,
      );

  static OrderStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'dateTime': _dateTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'dateTime': serializeParam(
          _dateTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static OrderStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderStatusStruct(
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        dateTime: deserializeParam(
          data['dateTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'OrderStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderStatusStruct &&
        status == other.status &&
        dateTime == other.dateTime;
  }

  @override
  int get hashCode => const ListEquality().hash([status, dateTime]);
}

OrderStatusStruct createOrderStatusStruct({
  int? status,
  DateTime? dateTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderStatusStruct(
      status: status,
      dateTime: dateTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderStatusStruct? updateOrderStatusStruct(
  OrderStatusStruct? orderStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orderStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderStatusStructData(
  Map<String, dynamic> firestoreData,
  OrderStatusStruct? orderStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderStatus == null) {
    return;
  }
  if (orderStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orderStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderStatusData =
      getOrderStatusFirestoreData(orderStatus, forFieldValue);
  final nestedData =
      orderStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orderStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderStatusFirestoreData(
  OrderStatusStruct? orderStatus, [
  bool forFieldValue = false,
]) {
  if (orderStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orderStatus.toMap());

  // Add any Firestore field values
  orderStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderStatusListFirestoreData(
  List<OrderStatusStruct>? orderStatuss,
) =>
    orderStatuss?.map((e) => getOrderStatusFirestoreData(e, true)).toList() ??
    [];
