import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shorten/app_core/local_storage/db_helper.dart';
import 'package:shorten/network/api.dart';
import 'package:shorten/view/history/model/history_model.dart';
import 'package:shorten/view/home/model/ShortenUrlModel.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitialState()) {
    on<HistoryUrlShortenEvent>(_onShortenUrl);
    on<HistoryEvent>(_onHistory);
    on<RemoveUrlEvent>(_onRemoveUrl);
  }

  Future<void> _onShortenUrl(
      HistoryUrlShortenEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(HistoryShortenLoadingState());
     await Api().shortenUrl(event.url).then((res){
      if (res.apiModel!.status) {
        var data = ShortenUrlModel.fromJson(res.apiModel!.data['result']);
        DbHistory.dbInstance.addUrl(data.fullShortLink, data.originalLink);
        emit(HistoryShortenUrlState(data));
      } else {
        emit(HistoryShortenUrlFailureState(error: res.apiModel!.message));
      }

    });
  }

  Future<void> _onHistory(
      HistoryEvent event,
      Emitter<HistoryState> emit,
      ) async {
    var res = await DbHistory.dbInstance.getHistoryList();
    emit(HistoryListState(res));
  }
  Future<void> _onRemoveUrl(
      RemoveUrlEvent event,
      Emitter<HistoryState> emit,
      ) async {
    emit(HistoryLoadingState());
    await DbHistory.dbInstance.delete(event.id!);
    emit(UrlRemoveState());
  }
}
