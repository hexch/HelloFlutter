part of 'searchbloc_bloc.dart';

@immutable
abstract class SearchblocEvent {}

class SearchContentsEvent extends SearchblocEvent {
  SearchContentsEvent(this.keyword);
  final String keyword;
}

class GetRecommandedKeyWordEvent extends SearchblocEvent {
  GetRecommandedKeyWordEvent(this.genreId);
  final String genreId;
}

class AddGenreEvent extends SearchblocEvent {
  AddGenreEvent(this.keyword);
  final String keyword;
}

class DeleteGenreEvent extends SearchblocEvent {
  DeleteGenreEvent(this.deleteGenreIds);
  final List<String> deleteGenreIds;
}

class GetAgainRecommandedKeyWordEvent extends SearchblocEvent {
  GetAgainRecommandedKeyWordEvent(this.genreId);
  final String genreId;
}

class GetMoreContentsEvent extends SearchblocEvent {
  GetMoreContentsEvent(this.sectionId);
  final String sectionId;
}

class CheckRecommandedGenreIdEvent extends SearchblocEvent {
  CheckRecommandedGenreIdEvent(this.genreId);
  final String genreId;
}
