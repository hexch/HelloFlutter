import 'package:flutter/material.dart';

class TabBarTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("TabBar & TabView Study"),
      ),
      body: FilterWidget(),
    ));
  }
}

class FilterWidget extends StatefulWidget {
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: getTabs(),
            controller: _tabController,
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            indicatorPadding:
                EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
          ),
        ),
        //Todo
        body: TabBarView(
          controller: _tabController,
          children: [MainPage(), Text("test")].toList(),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => {setState(() {})});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<FilterItem> getTabs() => <FilterItem>[
        FilterItem(
          image: _tabController.index == 0
              ? Icon(Icons.people)
              : Icon(Icons.cloud),
          title: _tabController.index == 0 ? "people" : "cloud",
        ),
        FilterItem(
          image:
              _tabController.index == 0 ? Icon(Icons.camera) : Icon(Icons.cake),
          title: _tabController.index == 0 ? "camera" : "cake",
        ),
      ];
  TabController _tabController;
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(
      text: 'One',
    ),
    Tab(
      text: "Two",
    ),
    Tab(
      text: "Three",
    ),
    Tab(
      text: "Four",
    )
  ];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TabBar(
//          isScrollable: true,
            tabs: tabs,
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            indicatorPadding:
                EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            // indicator: CustomTabIndicator(),
            labelColor: Colors.purple,
          ),
        ),
        //Todo
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((tab) {
            return _createTab(tab);
          }).toList(),
        ));
  }

  Widget _createTab(Tab tab) {
    return Center(
      child: Text(
        "10 min Rest Time",
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final Icon image;
  final String title;

  const FilterItem({Key key, this.image, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 50,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: image,
          ),
          Container(
            alignment: Alignment.center,
            height: 15,
            child: Text(title),
          )
        ],
      ),
    );
  }
}
