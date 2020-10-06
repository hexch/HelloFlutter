import 'dart:async';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class CounterBloc {
  int _counter = 0;
  final _counter$ = BehaviorSubject<int>.seeded(0);
  final _incrementController = StreamController<Void>();
  CounterBloc() {
    _incrementController.stream.listen((event) => _counter$.add(++_counter));
  }
  Sink<Void> get increment => _incrementController.sink;
  Stream<int> get counter$ => _counter$.stream;

  void dispose() {
    _incrementController.close();
    _counter$.close();
  }
}

class CounterBlocProvider extends InheritedWidget {
  final CounterBloc bloc;
  CounterBlocProvider({Key key, this.bloc, child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CounterBloc of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterBlocProvider>().bloc;
}
