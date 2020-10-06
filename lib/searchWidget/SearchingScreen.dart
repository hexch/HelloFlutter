import 'package:flutter/material.dart';

import 'SearchAppBar.dart';

class SearchingScreen extends PageRoute {
  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => false;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SearchingPageWidget();
  }
}

class SearchingPageWidget extends StatefulWidget {
  final _textEditingController = TextEditingController();

  @override
  _SearchingPageWidgetState createState() => _SearchingPageWidgetState();
}

class _SearchingPageWidgetState extends State<SearchingPageWidget> {
  var _queryString = "";
  _onChanged(value) {
    setState(() {
      _queryString = value;
    });
  }

  _onClear() {
    widget._textEditingController.clear();
    this._onChanged("");
  }

  _onListItemTaped(value) {
    widget._textEditingController.text = value;
    widget._textEditingController.selection =
        TextSelection.fromPosition(TextPosition(offset: value.length));
    this._onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        searchAppBarTitle: SearchAppBarTitle(
          leftItem: ButtonItem(
            icon: Icon(Icons.arrow_back),
            margin: leftEdgeInsets,
            onTap: () => {Navigator.pop(context)},
          ),
          rightItem: Visibility(
            visible: _queryString.isNotEmpty,
            child: ButtonItem(
              icon: Icon(Icons.close),
              margin: rightEdgeInsets,
              onTap: () => _onClear(),
            ),
          ),
          centerItem: SearchAppBarTitleCenterItem(
            onChanged: _onChanged,
            textEditingController: widget._textEditingController,
          ),
          border: BoxDecoration(
            border: Border.all(color: Color(0xff0074D9)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchSectionBar(),
          Divider(
            color: Color(0xFFE0E0E0),
            height: 1,
          ),
          Expanded(
              child: SearchingPageList(
            items: ["映画", "スイーツ", "コロナウイルス", "インテリア", "ホルダリング"],
            onTap: _onListItemTaped,
          )),
        ],
      ),
    );
  }
}

class SearchAppBarTitleCenterItem extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String) onChanged;

  const SearchAppBarTitleCenterItem(
      {Key key, @required this.textEditingController, @required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // color: Colors.blue,
        child: TextField(
          controller: textEditingController,
          onChanged: onChanged,
          autofocus: true,
          style: TextStyle(fontSize: 17),
          enabled: true,
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
      ),
    );
  }
}

// class SearchingPageBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         SearchSectionBar(),
//         Divider(
//           color: Color(0xFFE0E0E0),
//           height: 1,
//         ),
//         Expanded(child: SearchingPageList()),
//       ],
//     );
//   }
// }

class SearchingPageList extends StatelessWidget {
  final List<String> items;
  final Function(String) onTap;

  const SearchingPageList({Key key, @required this.items, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => SizedBox(
              width: double.infinity,
              height: 55,
              child: ListTile(
                title: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Text(
                    items[index],
                    style: TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () => {onTap(items[index])},
              ),
            ),
        separatorBuilder: (context, index) => Container(
              margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Divider(
                color: Color(0xffEEEEEE),
                height: 1,
              ),
            ),
        itemCount: items.length);
  }
}

class SearchSectionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Text(
              "おすすめ",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0074d9)),
            ),
          ),
          Expanded(
            child: Text(""),
          ),
          SizedBox(
            width: 74,
            height: double.infinity,
            child: InkWell(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Text(
                  "更新",
                  style: TextStyle(fontSize: 13, color: Color(0xffFFFFFF)),
                ),
                decoration: BoxDecoration(
                  // border: Border.all(color: Color(0xff0074D9)),
                  color: Color(0xff1976D2),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
