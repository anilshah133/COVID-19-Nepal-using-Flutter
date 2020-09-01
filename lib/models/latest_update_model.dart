import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/pages/loading.dart';
import 'package:flutterapp/pages/latest_update.dart';
import 'package:flutterapp/pages/summary.dart';

class LatestUpdateModel{
  String _activeCases;
  String _lastUpdate;
  String _newCases;
  String _newDeaths;
  String _totalCase;
  String _totalDeaths;
  String _totalRecovered;

  LatestUpdateModel(
      this._activeCases,
      this._lastUpdate,
      this._newCases,
      this._newDeaths,
      this._totalCase,
      this._totalDeaths,
      this._totalRecovered);

  String get totalRecovered => _totalRecovered;

  set totalRecovered(String value) {
    _totalRecovered = value;
  }

  String get totalDeaths => _totalDeaths;

  set totalDeaths(String value) {
    _totalDeaths = value;
  }

  String get totalCase => _totalCase;

  set totalCase(String value) {
    _totalCase = value;
  }

  String get newDeaths => _newDeaths;

  set newDeaths(String value) {
    _newDeaths = value;
  }

  String get newCases => _newCases;

  set newCases(String value) {
    _newCases = value;
  }

  String get lastUpdate => _lastUpdate;

  set lastUpdate(String value) {
    _lastUpdate = value;
  }

  String get activeCases => _activeCases;

  set activeCases(String value) {
    _activeCases = value;
  }

  @override
  String toString() {
    return 'LatestUpdateModel{_activeCases: $_activeCases, _lastUpdate: $_lastUpdate, _newCases: $_newCases, _newDeaths: $_newDeaths, _totalCase: $_totalCase, _totalDeaths: $_totalDeaths, _totalRecovered: $_totalRecovered}';
  }
}

