import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_quote/feature/quote/domain/usecases/get_quote_usecase.dart';
import 'package:flutter_quote/feature/quote/presentation/bloc/remote/quote/quote_event.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/entities/quote.dart';
part 'quote_state.dart';

class RemoteQuoteBloc extends Bloc<RemoteQuoteEvent, RemoteQuoteState> {
  final GetQuoteUsecase _getQuoteUsecase;

  RemoteQuoteBloc(this._getQuoteUsecase) : super(const RemoteQuoteLoading()) {
    on<GetQuote>(onGetQuote);
  }

  void onGetQuote(GetQuote event, Emitter<RemoteQuoteState> emit) async {
    final dataState = await _getQuoteUsecase();
    if (dataState is DataSuccess && dataState.data!.quotes.isNotEmpty) {
      print(dataState.data);
      emit(RemoteQuoteSuccess(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteQuoteFailed(dataState.error!));
    }
  }
}
