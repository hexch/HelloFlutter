import 'dart:math';

import 'package:flutter/material.dart';

class UniqueColorGenerator {
  List<Color> colorList = [Colors.blue, Colors.yellow, Colors.red];

  Random random = new Random();

  Color getColor() {
    return colorList[random.nextInt(3)];
  }
}

class StatelessColorfulTile extends StatelessWidget {
  final Color defautlColor = UniqueColorGenerator().getColor();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Container(
        color: defautlColor,
      ),
    );
  }
}

class StatefulColorfulTile extends StatefulWidget {
  StatefulColorfulTile({Key key}) : super(key: key);

  @override
  StatefulColorfulTileState createState() => StatefulColorfulTileState();
}

class StatefulColorfulTileState extends State<StatefulColorfulTile> {
  final Color defaultColor = UniqueColorGenerator().getColor();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Container(
        color: defaultColor,
      ),
    );
  }
}

class SwapColorDemo1 extends StatefulWidget {
  @override
  _SwapColorDemo1State createState() => _SwapColorDemo1State();
}

class _SwapColorDemo1State extends State<SwapColorDemo1> {
  List<Widget> widgets;

  @override
  void initState() {
    super.initState();
    widgets = [StatelessColorfulTile(), StatelessColorfulTile()];
    print("initState:");
    widgets.forEach((element) {
      print(element.runtimeType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless'),
      ),
      body: SafeArea(
        child: Row(
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.account_box),
        onPressed: swapTile,
      ),
    );
  }

  swapTile() {
    setState(() {
      widgets.insert(1, widgets.removeAt(0));
    });
  }
}

class SwapColorDemo2 extends StatefulWidget {
  @override
  _SwapColorDemo2State createState() => _SwapColorDemo2State();
}

class _SwapColorDemo2State extends State<SwapColorDemo2> {
  List<Widget> widgets;

  @override
  void initState() {
    super.initState();
    widgets = [
      StatefulColorfulTile(),
      StatefulColorfulTile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful_without_key'),
      ),
      body: SafeArea(
        child: Row(
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.account_box),
        onPressed: swapTile,
      ),
    );
  }

  swapTile() {
    setState(() {
      print("swap");
      widgets.insert(1, widgets.removeAt(0));
    });
  }
}

class SwapColorDemo3 extends StatefulWidget {
  @override
  _SwapColorDemo3State createState() => _SwapColorDemo3State();
}

class _SwapColorDemo3State extends State<SwapColorDemo3> {
  List<Widget> widgets;

  @override
  void initState() {
    super.initState();
    widgets = [
      StatefulColorfulTile(key: UniqueKey()),
      StatefulColorfulTile(key: UniqueKey()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful_with_key'),
      ),
      body: SafeArea(
        child: Row(
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.account_box),
        onPressed: swapTile,
      ),
    );
  }

  swapTile() {
    setState(() {
      print("swap");
      widgets.insert(1, widgets.removeAt(0));
    });
  }
}
