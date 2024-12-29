import 'package:flutter_quote/feature/quote/domain/entities/quote.dart';

import '../../../../core/resources/data_state.dart';

abstract class QuoteRepository {
  Future<DataState<QuoteEntity>> getQuotes();
}
