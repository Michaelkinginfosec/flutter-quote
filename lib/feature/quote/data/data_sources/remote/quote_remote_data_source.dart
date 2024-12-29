import 'package:dio/dio.dart';
import 'package:flutter_quote/core/constants/constants.dart';
import 'package:flutter_quote/feature/quote/data/model/quote.dart';
import 'package:retrofit/retrofit.dart';

part 'quote_remote_data_source.g.dart';

@RestApi(baseUrl: quoteApiURL)
abstract class QuoteApiService {
  factory QuoteApiService(Dio dio) = _QuoteApiService;

  @GET("/quotes")
  Future<HttpResponse<QuoteModel>> getQuotes({
    @Query("page") int? page,
    @Query("page_size") int? pageSize,
    @Query("format") String format = "json",
  });
}
