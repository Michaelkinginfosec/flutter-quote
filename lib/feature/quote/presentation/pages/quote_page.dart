// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quote/feature/quote/presentation/bloc/remote/quote/quote_bloc.dart';
import '../../../../core/utils/share_utils.dart';

class QuotePage extends StatelessWidget {
  const QuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: BlocBuilder<RemoteQuoteBloc, RemoteQuoteState>(
        builder: (context, state) {
          if (state is RemoteQuoteLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is RemoteQuoteFailed) {
            return const Center(
              child: Icon(Icons.refresh),
            );
          }
          if (state is RemoteQuoteSuccess) {
            final quotes = state.quotes!.quotes;

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quotes",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          CupertinoIcons.heart_fill,
                          color: Color(0xFFEB5A53),
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: quotes.length,
                        itemBuilder: (contex, index) {
                          final quoteItem = quotes[index];
                          final quote = quoteItem.text;
                          final author = quoteItem.author;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Container(
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SingleChildScrollView(
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 130,
                                        child: Text(
                                          quote,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "SF Thonburi",
                                            color: Colors.grey,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      author,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "SF Thonburi",
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          CupertinoIcons.heart,
                                          color: Color(0xFFEB5A53),
                                        ),
                                        SizedBox(
                                          width: 70,
                                        ),
                                        GestureDetector(
                                          onTap: () => ShareUtils.shareQuote(
                                            "auot", "author",
                                            // quote, ""
                                            // author,
                                          ),
                                          child: Icon(
                                            Icons.share_sharp,
                                            color: Color(0xFF265CDF),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
