import 'package:dio/dio.dart';
import 'package:flutter_quote/feature/quote/data/data_sources/remote/quote_remote_data_source.dart';
import 'package:flutter_quote/feature/quote/data/respositories/quote_repository_impl.dart';
import 'package:flutter_quote/feature/quote/domain/repositories/quote_repository.dart';
import 'package:flutter_quote/feature/quote/domain/usecases/get_quote_usecase.dart';
import 'package:flutter_quote/feature/quote/presentation/bloc/remote/quote/quote_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Service
  sl.registerSingleton<QuoteApiService>(QuoteApiService(sl()));

  sl.registerSingleton<QuoteRepository>(QuoteRepositoryImpl(sl()));

  //Usecases

  sl.registerSingleton<GetQuoteUsecase>(GetQuoteUsecase(sl()));

  //blocs

  sl.registerFactory<RemoteQuoteBloc>(
    () => RemoteQuoteBloc(sl()),
  );
}
