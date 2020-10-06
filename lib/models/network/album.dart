import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

// import 'dart:convert';

part 'album.g.dart';

@JsonSerializable()
class Album {
  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  final int id;
  final String title;
  final int userId;

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}

main() {
  runApp(MaterialApp(
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
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MYHOME()));
}

class MYHOME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: ChangeNotifierProvider(
          create: (context) => AlbumViewModel(),
          builder: (context, _) {
            return Column(
              children: [
                FetchButton(),
                CounterWidget(),
              ],
            );
          },
        )),
      ),
    );
  }
}

class FetchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<AlbumViewModel>(
      builder: (context, albumViewModel, _) => RaisedButton(
        onPressed: () {
          albumViewModel.count();
        },
        child: Text("fetch"),
      ),
    ));
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<AlbumViewModel>(
          builder: (context, albumViewModel, _) => Text("${albumViewModel.a}")),
    );
  }
}

class Mainwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<AlbumViewModel>(
          builder: (context, albumViewModel, _) => Text("${albumViewModel.a}")),
    );
  }
}

class AlbumViewModel extends ChangeNotifier {
  Album _album;
  int a = 0;

  get album => this._album;
  get albumId => this._album == null ? -1 : this._album.id;

  void count() {
    a++;
    notifyListeners();
  }

  void fetchAlbum() {
    fetch().then((value) => _album = value);
    notifyListeners();
  }

  Future<Album> fetch() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/albums/1');
    if (response.statusCode == 200) {
      var alb = Album.fromJson(json.decode(response.body));
      print("alb :${alb.toJson()}");
      return alb;
    } else {
      return null;
    }
  }
}
