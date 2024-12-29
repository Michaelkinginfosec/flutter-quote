// import 'package:equatable/equatable.dart';

// class QuoteEntity extends Equatable {
//   final String? quote;
//   final String? author;
//   final String? category;
//   const QuoteEntity({
//     this.quote,
//     this.author,
//     this.category,
//   });

//   @override
//   List<Object?> get props => [quote, author, category];
// }

import 'package:equatable/equatable.dart';

/// Entity class
class QuoteEntity extends Equatable {
  final List<QuoteItemEntity> quotes;
  final PaginationEntity pagination;

  const QuoteEntity({
    required this.quotes,
    required this.pagination,
  });

  @override
  List<Object?> get props => [quotes, pagination];
}

/// Quote item in the list (Entity)
class QuoteItemEntity extends Equatable {
  final String text;
  final String author;
  final List<String> tags;
  final int id;
  final String authorId;

  const QuoteItemEntity({
    required this.text,
    required this.author,
    required this.tags,
    required this.id,
    required this.authorId,
  });

  @override
  List<Object?> get props => [text, author, tags, id, authorId];
}

/// Pagination Entity
class PaginationEntity extends Equatable {
  final int page;
  final int pageSize;
  final int total;
  final int pages;
  final String next;

  const PaginationEntity({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.pages,
    required this.next,
  });

  @override
  List<Object?> get props => [page, pageSize, total, pages, next];
}
