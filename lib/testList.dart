import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;
import 'dart:async';

class _TestHeader extends SliverPersistentHeaderDelegate {
  _TestHeader({
    @required this.collapsedHeight,
    @required this.expandedHeight,
    @required this.showHeading,
  });

  bool showHeading;
  final double expandedHeight;
  final double collapsedHeight;

  @override
  double get minExtent => collapsedHeight;

  @override
  double get maxExtent => math.max(expandedHeight, minExtent);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        const SizedBox(height: 24.0),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: const Border(
                top: const BorderSide(
                    color: const Color(0xFFBCBBC1), width: 0.0),
                bottom: const BorderSide(
                    color: const Color(0xFFBCBBC1), width: 0.0),
              ),
            ),
            height: 44.00,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    const Text(
                      'This is my heading',
                      style: const TextStyle(
                          color: CupertinoColors.activeBlue, fontSize: 16.0),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget build1(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print("rebuilding headings");
    return new SafeArea(
        child: Column(children: <Widget>[
      const SizedBox(height: 24.0),
      new GestureDetector(
        onTap: () {},
        child: new Container(
          decoration: const BoxDecoration(
            color: CupertinoColors.white,
            border: const Border(
              top: const BorderSide(color: const Color(0xFFBCBBC1), width: 0.0),
              bottom:
                  const BorderSide(color: const Color(0xFFBCBBC1), width: 0.0),
            ),
          ),
          height: 44.0,
          child: new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: new SafeArea(
              top: false,
              bottom: false,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  const Text(
                    'This is my heading',
                    style: const TextStyle(
                        color: CupertinoColors.activeBlue, fontSize: 16.0),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ]));
  }

  @override
  bool shouldRebuild(@checked _TestHeader oldDelegate) {
//    return false;
    return expandedHeight != oldDelegate.expandedHeight ||
        collapsedHeight != oldDelegate.collapsedHeight;
  }
}

class TestHeaderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TestHeaderState();
  }
}

class TestHeaderState extends State<TestHeaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: RaisedButton(
                  child: Icon(Icons.people),
                  color: Colors.orange,
                  textColor: Colors.white,
                  splashColor: Colors.black,
                  onPressed: () {}),
            ),
          ),
          SliverPersistentHeader(
            delegate: _TestHeader(
                collapsedHeight: 136, expandedHeight: 136, showHeading: true),
          )
        ],
      )),
    );
  }

  Widget build1(BuildContext context) {
    // TODO: implement build
    return new CupertinoPageScaffold(
        //i will need to convert this to a sliver list to make this work properly.
        backgroundColor: const Color(0xFFEFEFF4),
        navigationBar: new CupertinoNavigationBar(
          middle: new Text('Test Headers'),
        ),
        child: new SafeArea(
          child: new CustomScrollView(slivers: <Widget>[
            SliverToBoxAdapter(
              child: RaisedButton(
                child: Text("Button"),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          ]),
        ));
  }
}
