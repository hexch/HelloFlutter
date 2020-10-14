import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'searchbloc_event.dart';
part 'searchbloc_state.dart';

class SearchblocBloc extends Bloc<SearchblocEvent, SearchblocState> {
  SearchblocBloc() : super(SearchblocInitial());

  @override
  Stream<SearchblocState> mapEventToState(
    SearchblocEvent event,
  ) async* {
    print(event);
    if (event is SearchContentsEvent) {
      yield* _searchContents();
    }
    if (event is GetRecommandedKeyWordEvent) {
      yield* _getRecommandedKeyWord();
    }
    if (event is AddGenreEvent) {}
    if (event is DeleteGenreEvent) {}
    if (event is GetAgainRecommandedKeyWordEvent) {}
    if (event is GetMoreContentsEvent) {}
    if (event is CheckRecommandedGenreIdEvent) {}
  }

  Stream<SearchblocState> _searchContents() async* {
    yield SearchingContentsState([]);
    await new Future.delayed(new Duration(milliseconds: 2500));
    // yield FailedSearchContentsState();
    yield SearchContentsState([]);
  }

  final List<String> _recommandedKeyWords = [
    "映画",
    "スイーツ",
    "コロナウイルス",
    "インチリア",
    "ホルダリング",
    "山梨",
    "東京",
    "オリンピック",
    "埼玉",
    "千葉県",
    "神奈川",
    "品川",
    "北海道",
    "沖縄",
    "大分",
    "大阪",
    "京都",
    "大台場",
  ];
  List<String> randomKeywords(int n) {
    final _random = new Random();
    List<String> ret = [];
    for (var i = 0; i < n; i++) {
      ret.add(
          _recommandedKeyWords[_random.nextInt(_recommandedKeyWords.length)]);
    }
    return ret;
  }

  Stream<SearchblocState> _getRecommandedKeyWord() async* {
    await new Future.delayed(new Duration(milliseconds: 500));

    yield GetRecommendsWordState(randomKeywords(10));
  }
}
