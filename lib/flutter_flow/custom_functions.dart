import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String formatPrice(double price) {
  var locale = 'ru_RU';

  // Создаем форматтер для валюты
  final formatter = NumberFormat.currency(
    locale: locale,
    symbol: '₽', // Если символ валюты не указан, будет использован локальный
  );

  // Форматируем цену
  return formatter.format(price);
}

String getRate(List<int> rates) {
  double rate = 0;
  if (rates.isNotEmpty) {
    double sum = 0;
    for (var i in rates) {
      sum += i;
    }
    rate = sum / rates.length;
  }
  return "${rate.toStringAsFixed(1)}";
}

String getExperienceString(
  int value,
  String one,
  String two,
  String five,
  bool onlyStr,
) {
  String str = "";
  var n = value.abs() % 100;
  var n1 = n % 10;
  if (n > 10 && n < 20) {
    str = five;
  } else if (n1 > 1 && n1 < 5) {
    str = two;
  } else if (n1 == 1) {
    str = one;
  } else {
    str = five;
  }

  return onlyStr ? "$str" : "$value $str";
}
