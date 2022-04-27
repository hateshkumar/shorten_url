import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shorten/app_core/local_storage/db_helper.dart';
import 'package:shorten/network/api.dart';
import 'package:shorten/view/home/model/ShortenUrlModel.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<UrlShortenEvent>(_onShortenUrl);
  }

  Future<void> _onShortenUrl(
    UrlShortenEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    var res = await Api().shortenUrl(
        event.url);
    if (res.apiModel!.status) {
      var data = ShortenUrlModel.fromJson(res.apiModel!.data['result']);
      DbHistory.dbInstance.addUrl(data.fullShortLink, data.originalLink);
      emit(ShortenUrlState(data));
    } else {
      emit(ShortenUrlFailureState(error: res.apiModel!.message));
    }
  }
}
