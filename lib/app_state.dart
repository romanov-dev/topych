import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _onboardingShown =
          prefs.getBool('ff_onboardingShown') ?? _onboardingShown;
    });
    _safeInit(() {
      _termsOfUseUrl = prefs.getString('ff_termsOfUseUrl') ?? _termsOfUseUrl;
    });
    _safeInit(() {
      _privacyPolicyUrl =
          prefs.getString('ff_privacyPolicyUrl') ?? _privacyPolicyUrl;
    });
    _safeInit(() {
      _loginCodeTimerValue =
          prefs.getInt('ff_loginCodeTimerValue') ?? _loginCodeTimerValue;
    });
    _safeInit(() {
      _priceRanges = prefs
              .getStringList('ff_priceRanges')
              ?.map((x) {
                try {
                  return FilterPriceRangeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _priceRanges;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _onboardingShown = false;
  bool get onboardingShown => _onboardingShown;
  set onboardingShown(bool value) {
    _onboardingShown = value;
    prefs.setBool('ff_onboardingShown', value);
  }

  String _termsOfUseUrl =
      'https://sites.google.com/view/remont-ru/условия-использования';
  String get termsOfUseUrl => _termsOfUseUrl;
  set termsOfUseUrl(String value) {
    _termsOfUseUrl = value;
    prefs.setString('ff_termsOfUseUrl', value);
  }

  String _privacyPolicyUrl =
      'https://sites.google.com/view/remont-ru/политика-конфиденциальности';
  String get privacyPolicyUrl => _privacyPolicyUrl;
  set privacyPolicyUrl(String value) {
    _privacyPolicyUrl = value;
    prefs.setString('ff_privacyPolicyUrl', value);
  }

  int _loginCodeTimerValue = 60000;
  int get loginCodeTimerValue => _loginCodeTimerValue;
  set loginCodeTimerValue(int value) {
    _loginCodeTimerValue = value;
    prefs.setInt('ff_loginCodeTimerValue', value);
  }

  int _menuIndexSelected = 0;
  int get menuIndexSelected => _menuIndexSelected;
  set menuIndexSelected(int value) {
    _menuIndexSelected = value;
  }

  List<FilterPriceRangeStruct> _priceRanges = [
    FilterPriceRangeStruct.fromSerializableMap(
        jsonDecode('{\"from\":\"1\",\"to\":\"500\",\"index\":\"0\"}')),
    FilterPriceRangeStruct.fromSerializableMap(
        jsonDecode('{\"from\":\"501\",\"to\":\"1000\",\"index\":\"1\"}')),
    FilterPriceRangeStruct.fromSerializableMap(
        jsonDecode('{\"from\":\"1001\",\"to\":\"1500\",\"index\":\"2\"}')),
    FilterPriceRangeStruct.fromSerializableMap(
        jsonDecode('{\"from\":\"1501\",\"to\":\"2000\",\"index\":\"3\"}')),
    FilterPriceRangeStruct.fromSerializableMap(
        jsonDecode('{\"from\":\"2001\",\"to\":\"2500\",\"index\":\"4\"}')),
    FilterPriceRangeStruct.fromSerializableMap(
        jsonDecode('{\"from\":\"2501\",\"to\":\"3000\",\"index\":\"5\"}')),
    FilterPriceRangeStruct.fromSerializableMap(
        jsonDecode('{\"from\":\"3001\",\"to\":\"1000000000\",\"index\":\"6\"}'))
  ];
  List<FilterPriceRangeStruct> get priceRanges => _priceRanges;
  set priceRanges(List<FilterPriceRangeStruct> value) {
    _priceRanges = value;
    prefs.setStringList(
        'ff_priceRanges', value.map((x) => x.serialize()).toList());
  }

  void addToPriceRanges(FilterPriceRangeStruct value) {
    priceRanges.add(value);
    prefs.setStringList(
        'ff_priceRanges', _priceRanges.map((x) => x.serialize()).toList());
  }

  void removeFromPriceRanges(FilterPriceRangeStruct value) {
    priceRanges.remove(value);
    prefs.setStringList(
        'ff_priceRanges', _priceRanges.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPriceRanges(int index) {
    priceRanges.removeAt(index);
    prefs.setStringList(
        'ff_priceRanges', _priceRanges.map((x) => x.serialize()).toList());
  }

  void updatePriceRangesAtIndex(
    int index,
    FilterPriceRangeStruct Function(FilterPriceRangeStruct) updateFn,
  ) {
    priceRanges[index] = updateFn(_priceRanges[index]);
    prefs.setStringList(
        'ff_priceRanges', _priceRanges.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPriceRanges(int index, FilterPriceRangeStruct value) {
    priceRanges.insert(index, value);
    prefs.setStringList(
        'ff_priceRanges', _priceRanges.map((x) => x.serialize()).toList());
  }

  int _priceSort = 0;
  int get priceSort => _priceSort;
  set priceSort(int value) {
    _priceSort = value;
  }

  FilterTypeStruct _itemsFilter = FilterTypeStruct.fromSerializableMap(
      jsonDecode('{\"priceRange\":\"{}\"}'));
  FilterTypeStruct get itemsFilter => _itemsFilter;
  set itemsFilter(FilterTypeStruct value) {
    _itemsFilter = value;
  }

  void updateItemsFilterStruct(Function(FilterTypeStruct) updateFn) {
    updateFn(_itemsFilter);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
