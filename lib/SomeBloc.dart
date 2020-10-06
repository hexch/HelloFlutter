import 'dart:async';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class SomeBloc {
  int days = 365;
  final _days$ = BehaviorSubject<int>.seeded(-1);
  final _decreaseController = StreamController<Void>();

  SomeBloc() {
    _decreaseController.stream.listen((event) {
      _days$.add(--days);
    });
  }

  Sink<Void> get decrease => _decreaseController.sink;
  Stream<int> get days$ => _days$.stream;

  void dispose() {
    _days$.close();
    _decreaseController.close();
  }
}

class SomeBlocProvider extends InheritedWidget {
  SomeBloc bloc;
  SomeBlocProvider({Key key, this.bloc, child}) : super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static SomeBloc of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SomeBlocProvider>().bloc;
}
