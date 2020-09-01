import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/pages/loading.dart';
import 'package:flutterapp/pages/latest_update.dart';
import 'package:flutterapp/pages/summary.dart';
 class SummaryModel{
  String _tested_positive;
  String _tested_negative;
  String _tested_total;
  String _in_isolation;
  String _quarantined;
  String _tested_rdt;
  String _recovered;
  String _deaths;
  String _updated_at;


  SummaryModel(
      this._tested_positive,
      this._tested_negative,
      this._tested_total,
      this._in_isolation,
      this._quarantined,
      this._tested_rdt,
      this._recovered,
      this._deaths,
      this._updated_at);


  String get tested_positive => _tested_positive;

  set tested_positive(String value) {
    _tested_positive = value;
  }


  String get tested_negative => _tested_negative;

  set tested_negative(String value) {
    _tested_negative = value;
  }

  String get tested_total => _tested_total;

  set tested_total(String value) {
    _tested_total = value;
  }

  String get in_isolation => _in_isolation;

  set in_isolation(String value) {
    _in_isolation = value;
  }

  String get quarantined => _quarantined;

  set quarantined(String value) {
    _quarantined = value;
  }

  String get tested_rdt => _tested_rdt;

  set tested_rdt(String value) {
    _tested_rdt = value;
  }

  String get recovered => _recovered;

  set recovered(String value) {
    _recovered = value;
  }

  String get deaths => _deaths;

  set deaths(String value) {
    _deaths = value;
  }

  String get updated_at => _updated_at;

  set updated_at(String value) {
    _updated_at = value;
  }

  @override
  String toString() {
    return 'SummaryModel{tested_positive: $tested_positive, tested_negative: $tested_negative, tested_total: $tested_total, in_isolation: $in_isolation, quarantined: $quarantined, tested_rdt: $tested_rdt, recovered: $recovered, deaths: $deaths, updated_at: $updated_at}';
  }

 }