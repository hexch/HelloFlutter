import 'package:flutter/material.dart';
import 'package:hello_world/searchWidget/SearchAppBar.dart';

class SearchingWidget extends StatefulWidget {
  @override
  _SearchingWidgetState createState() => _SearchingWidgetState();
}

class _SearchingWidgetState extends State<SearchingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: SearchAppBar(isSearching: false),
      body: Center(
        child: Text("aa"),
      ),
    );
  }
}

class SearchPageRout extends PageRoute {
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
    return SearchPage();
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _queryString = "";
  var _textfieldController = TextEditingController();

  void _onChange(String value) {
    setState(() {
      _queryString = value;
    });
  }

  void _onSubmitted(String value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          // IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: () {
          //     showSearch(context: context, delegate: MySearchDelegate());
          //   },
          // )
        ],
        title: Container(
          height: 45,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: TextField(
                  controller: _textfieldController,
                  onChanged: _onChange,
                  onSubmitted: _onSubmitted,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "input genre",
                  ),
                ),
              ),
              Visibility(
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {},
                ),
                visible: _queryString.isNotEmpty,
              ),
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      body: SearchingListWidget(textController: this._textfieldController),
    );
  }
}

class SearchingListWidget extends StatelessWidget {
  final TextEditingController textController;

  SearchingListWidget({Key key, this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Row(
              children: [
                Text("おすすめ"),
                Expanded(
                  child: Container(),
                ),
                RaisedButton(
                  child: Text("更新"),
                  onPressed: () {},
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => ListTile(
                        title: Text("a"),
                        onTap: () {
                          textController.text = "a";
                        },
                      )),
            )
          ],
        ));
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Text("results"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
              title: Text("a"),
            ));
  }
}
