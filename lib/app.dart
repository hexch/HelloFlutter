import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/searchList.dart';
import 'package:hello_world/searchWidget/SearchTopScreen.dart';
import 'package:hello_world/searchWidget/TestWidget.dart';
import 'package:hello_world/testWidgets/filter_appbar.dart';
import 'package:hello_world/testWidgets/tabbar_test.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(TabBarTestApp());
  // runApp(HomeScreen());
}

class MyObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.white,
      ),
      // home: SwapColorDemo1(), //Stateless
      // home: SwapColorDemo2(), //stateful without key
      // home: SwapColorDemo3(), //stateful with key
      home: SearchTopScreen(),
      // home: TestScreen(),
    );
  }
}
