import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  final wordPair = WordPair.random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Test App",
        theme: ThemeData(primaryColor: Colors.white),
        home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18);

  final _saved = Set<WordPair>();

  Widget _buildRow(WordPair wordPair) {
    final alreadySaved = _saved.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asCamelCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) {
        return Divider();
      }
      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("abc"),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _gotoSavedPage,
          )
        ],
      ),
      body: _buildList(),
    );
  }

  void _gotoSavedPage() {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: SavedPage(savedWords: _saved, biggerFont: _biggerFont).build));
  }

  Widget _SavedPage(BuildContext context) {
    final tiles = _saved.map((e) => ListTile(
          title: Text(
            e.asPascalCase,
            style: _biggerFont,
          ),
        ));
    final divided =
        ListTile.divideTiles(context: context, tiles: tiles).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Page"),
      ),
      body: ListView(
        children: divided,
      ),
    );
  }
}

class SavedPage extends StatelessWidget {
  final Set<WordPair> savedWords;
  final TextStyle biggerFont;

  const SavedPage({Key key, this.savedWords, this.biggerFont})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tiles = savedWords.map((e) => ListTile(
          title: Text(
            e.asPascalCase,
            style: biggerFont,
          ),
        ));
    final divided =
        ListTile.divideTiles(context: context, tiles: tiles).toList();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Saved Words"),
        ),
      ),
      body: ListView(
        children: divided,
      ),
    );
  }
}
