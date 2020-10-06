import 'package:flutter/material.dart';

class SearchAppBar extends AppBar {
  final SearchAppBarTitle searchAppBarTitle;

  SearchAppBar({@required this.searchAppBarTitle})
      : super(
          automaticallyImplyLeading: false,
          titleSpacing: 8,
          title: searchAppBarTitle,
          elevation: 0,
        );
}

class SearchAppBarTitle extends StatelessWidget {
  final Widget leftItem;
  final Widget rightItem;
  final Widget centerItem;
  final BoxDecoration border;

  const SearchAppBarTitle(
      {Key key, this.leftItem, this.rightItem, this.centerItem, this.border})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leftItem,
            centerItem,
            rightItem,
          ]),
      decoration: border,
    );
  }
}

final EdgeInsets leftEdgeInsets = EdgeInsets.fromLTRB(8, 0, 12, 0);
final EdgeInsets rightEdgeInsets = EdgeInsets.fromLTRB(12, 0, 8, 0);

class ButtonItem extends StatelessWidget {
  final Icon icon;
  final EdgeInsets margin;
  final GestureTapCallback onTap;
  ButtonItem({@required this.icon, @required this.margin, @required this.onTap})
      : super();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: double.infinity,
      child: InkWell(
        child: Container(
          child: icon,
          margin: margin,
        ),
        onTap: onTap,
      ),
    );
  }
}
