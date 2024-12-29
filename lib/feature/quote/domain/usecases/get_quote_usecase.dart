import 'package:flutter_quote/core/resources/data_state.dart';
import 'package:flutter_quote/core/usecase/usecase.dart';
import 'package:flutter_quote/feature/quote/domain/repositories/quote_repository.dart';
import '../entities/quote.dart';

class GetQuoteUsecase implements Usecase<DataState<QuoteEntity>, void> {
  final QuoteRepository _quoteRepository;

  GetQuoteUsecase(this._quoteRepository);

  @override
  Future<DataState<QuoteEntity>> call({void prams}) {
    return _quoteRepository.getQuotes();
  }
}
