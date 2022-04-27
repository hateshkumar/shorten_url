part of 'history_bloc.dart';


abstract class HistoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}


class HistoryListEvent extends HistoryEvent {

  HistoryListEvent();

}

class HistoryUrlShortenEvent extends HistoryEvent {
  final String? url;

  HistoryUrlShortenEvent(this.url);

}
class RemoveUrlEvent extends HistoryEvent {
  final int? id;

  RemoveUrlEvent(this.id);

}


