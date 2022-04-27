part of 'home_bloc.dart';



abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class ShortenUrlState extends HomeState {
  final ShortenUrlModel shortenUrlModel;

  ShortenUrlState(this.shortenUrlModel);
}
class ShortenUrlFailureState extends HomeState {
  final String? error;

  ShortenUrlFailureState({ this.error});

  @override
  List<Object> get props => [ error!];
}

