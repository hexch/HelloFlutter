import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          Container(
            color: Colors.red,
            child: GenreTitleBar(
              genreName: "おすすめ",
            ),
          ),
          Expanded(child: Container()),
          Container(
            color: Colors.red,
            child: RecommandSectionBar(
              title: "映画",
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}

class RecommandSectionBar extends StatelessWidget {
  const RecommandSectionBar({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: Container(
        child: Row(
          children: [
            Container(
              child: _buildTitle(),
              margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
            ),
            Expanded(child: Container()),
            Container(
              child: _buildAddGenreButton(),
              margin: EdgeInsets.fromLTRB(0, 12, 16, 12),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff212121)),
    );
  }

  Widget _buildAddGenreButton() {
    return SizedBox(
        height: 24,
        width: 42,
        child: RaisedButton(
          onPressed: () {},
          padding: EdgeInsets.all(0),
          child: Text(
            "追加",
            style: TextStyle(fontSize: 13, color: Color(0xffFFFFFF)),
          ),
          color: Color(0xff1976D2),
        ));
  }

  final String title;
}

// class AddGenreButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 24,
//       width: 42,
//       child: InkWell(
//         child: Container(
//           alignment: Alignment.center,
//           child: Text(
//             "追加",
//             style: TextStyle(fontSize: 13, color: Color(0xffFFFFFF)),
//           ),
//           decoration: BoxDecoration(
//             // border: Border.all(color: Color(0xff0074D9)),
//             color: Color(0xff1976D2),
//             borderRadius: BorderRadius.circular(3),
//           ),
//         ),
//         onTap: () {
//           print("atete");
//         },
//       ),
//     );
//   }
// }

class GenreTitleBar extends StatelessWidget {
  const GenreTitleBar({Key key, this.genreName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: Container(
        child: Row(
          children: [
            _buildIconBox(),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 8),
              child: Text(
                genreName,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff212121)),
              ),
            )),
            _buildDeleteButton(),
          ],
        ),
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
        ),
      ),
    );
  }

  Widget _buildIconBox() {
    return SizedBox(
      width: 36,
      height: 36,
      child: Container(
        color: Color(0xFF0074D9),
        child: Text(
          genreName.substring(0, 1),
          style: TextStyle(fontSize: 23, color: Color(0xffFFFFFF)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return SizedBox(
      height: 36,
      width: 36,
      child: Container(
        child: IconButton(icon: Icon(Icons.delete), onPressed: () {}),
      ),
    );
  }

  final String genreName;
}
