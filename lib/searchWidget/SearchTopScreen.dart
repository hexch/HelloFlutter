import 'package:flutter/material.dart';

import 'SearchAppBar.dart';
import 'SearchingScreen.dart';

class SearchTopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
          searchAppBarTitle: SearchAppBarTitle(
        leftItem: ButtonItem(
          icon: Icon(Icons.dehaze),
          margin: leftEdgeInsets,
          onTap: () => {},
        ),
        rightItem: ButtonItem(
          icon: Icon(Icons.refresh),
          margin: rightEdgeInsets,
          onTap: () => {},
        ),
        centerItem: SearchAppBarTitleCenterItem(),
        border: BoxDecoration(
          border: Border.all(color: Color(0xffe0e0e0)),
          borderRadius: BorderRadius.circular(10),
        ),
      )),
      body: Center(
        child: Text("aa"),
      ),
    );
  }
}

class SearchAppBarTitleCenterItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: GestureDetector(
          child: TextField(
            // controller: _textfieldController,
            autofocus: false,
            style: TextStyle(fontSize: 17),
            enabled: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "ジャンルが追加できます",
              hintStyle: TextStyle(fontSize: 17, color: Color(0xFFC7C6CC)),
            ),
          ),
          onTap: () {
            // showSearch(context: context, delegate: MySearchDelegate());
            Navigator.push(context, SearchingScreen());
          },
        ),
      ),
    );
  }
}
