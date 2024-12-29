import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quote/feature/quote/presentation/bloc/remote/quote/quote_bloc.dart';
import 'package:flutter_quote/feature/quote/presentation/bloc/remote/quote/quote_event.dart';
import 'package:flutter_quote/feature/quote/presentation/pages/quote_page.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(
    BlocProvider<RemoteQuoteBloc>(
      create: (context) => sl()..add(const GetQuote()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quote App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const QuotePage(),
    );
  }
}
