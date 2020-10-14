part of 'searchbloc_bloc.dart';

@immutable
abstract class SearchblocState {}

class SearchblocInitial extends SearchblocState {}

class SearchContent {
  final String sectionId;
  final String sectionName;

  SearchContent(this.sectionId, this.sectionName);
}

class SearchContentsState extends SearchblocState {
  SearchContentsState(this.section);
  final List<SearchContent> section;
}

class SearchingContentsState extends SearchContentsState {
  SearchingContentsState(List<SearchContent> section) : super(section);
}

class FailedSearchContentsState extends SearchblocState {}

class GetRecommendsWordState extends SearchblocState {
  GetRecommendsWordState(this.recommendsWordList);
  final List<String> recommendsWordList;
}

class FailedGetRecommendsWordState extends SearchblocState {}

class AddGenreState extends SearchblocState {}

class AddingGenreState extends SearchblocState {}

class FailedAddGenreState extends SearchblocState {}

class DeleteGenreState extends SearchblocState {}

class DeletingGenreState extends SearchblocState {}

class FailedDeleteGenreState extends SearchblocState {}

class GetAgainRecommendsWordState extends SearchblocState {
  GetAgainRecommendsWordState(this.recommendsWordList);
  final List<String> recommendsWordList;
}

class FailedGetAgainRecommendsWordState extends SearchblocState {}

class CheckRecommandedGenreIdState extends SearchblocState {
  CheckRecommandedGenreIdState(this.isExist);
  final bool isExist;
}

class CheckingRecommandedGenreIdState extends SearchblocState {}

class FailedCheckRecommandedGenreIdState extends SearchblocState {}
