import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_quote/core/constants/constants.dart';
import 'package:flutter_quote/feature/quote/data/data_sources/remote/quote_remote_data_source.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repositories/quote_repository.dart';
import '../model/quote.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteApiService _quoteApiService;

  QuoteRepositoryImpl(this._quoteApiService);
  @override
  Future<DataState<QuoteModel>> getQuotes() async {
    try {
      final httpResponse = await _quoteApiService.getQuotes(
        page: page,
        pageSize: pageSize,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
