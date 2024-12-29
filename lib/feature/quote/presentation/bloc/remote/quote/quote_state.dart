part of 'quote_bloc.dart';

abstract class RemoteQuoteState extends Equatable {
  final QuoteEntity? quotes;
  final DioException? error;

  const RemoteQuoteState({this.error, this.quotes});

  @override
  List<Object> get props => [quotes!, error!];
}

class RemoteQuoteLoading extends RemoteQuoteState {
  const RemoteQuoteLoading();
}

class RemoteQuoteSuccess extends RemoteQuoteState {
  const RemoteQuoteSuccess(QuoteEntity quotes) : super(quotes: quotes);
}

class RemoteQuoteFailed extends RemoteQuoteState {
  const RemoteQuoteFailed(DioException error) : super(error: error);
}
