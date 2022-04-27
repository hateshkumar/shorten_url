part of 'history_bloc.dart';



abstract class HistoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class HistoryInitialState extends HistoryState {
  @override
  List<Object> get props => [];
}

class HistoryLoadingState extends HistoryState {
  @override
  List<Object> get props => [];
}
class HistoryShortenLoadingState extends HistoryState {
  @override
  List<Object> get props => [];
}

class HistoryShortenUrlState extends HistoryState {
  final ShortenUrlModel shortenUrlModel;

  HistoryShortenUrlState(this.shortenUrlModel);
}
class HistoryShortenUrlFailureState extends HistoryState {
  final String? error;

  HistoryShortenUrlFailureState({ this.error});

  @override
  List<Object> get props => [ error!];
}
class HistoryListState extends HistoryState {
  final List<HistoryLocalModel> list;

  HistoryListState(this.list);
}
class UrlRemoveState extends HistoryState {
  @override
  List<Object> get props => [];
}

