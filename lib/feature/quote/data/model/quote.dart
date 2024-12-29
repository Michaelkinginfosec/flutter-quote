import '../../domain/entities/quote.dart';

/// Model class that extends Entity
class QuoteModel extends QuoteEntity {
  const QuoteModel({
    required List<QuoteItemModel> quotes,
    required PaginationModel pagination,
  }) : super(
          quotes: quotes,
          pagination: pagination,
        );

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      quotes: (json['quotes'] as List)
          .map((item) => QuoteItemModel.fromJson(item))
          .toList(),
      pagination: PaginationModel.fromJson(json['pagination']),
    );
  }

  Map<String, dynamic> toJson() => {
        'quotes':
            quotes.map((item) => (item as QuoteItemModel).toJson()).toList(),
        'pagination': (pagination as PaginationModel).toJson(),
      };
}

/// QuoteItemModel extends QuoteItemEntity
class QuoteItemModel extends QuoteItemEntity {
  const QuoteItemModel({
    required super.text,
    required super.author,
    required super.tags,
    required super.id,
    required super.authorId,
  });

  factory QuoteItemModel.fromJson(Map<String, dynamic> json) {
    return QuoteItemModel(
      text: json['text'],
      author: json['author'],
      tags: List<String>.from(json['tags']),
      id: json['id'],
      authorId: json['author_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'text': text,
        'author': author,
        'tags': tags,
        'id': id,
        'author_id': authorId,
      };
}

/// PaginationModel extends PaginationEntity
class PaginationModel extends PaginationEntity {
  const PaginationModel({
    required super.page,
    required super.pageSize,
    required super.total,
    required super.pages,
    required super.next,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      page: json['page'],
      pageSize: json['page_size'],
      total: json['total'],
      pages: json['pages'],
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
        'total': total,
        'pages': pages,
        'next': next,
      };
}



// import '../../domain/entities/quote.dart';

// class QuoteModel extends QuoteEntity {
//   const QuoteModel({
//     List<Map<String, dynamic>>? quotes,
//     String? author,
//     String? category,
//   });

//   factory QuoteModel.fromJson(Map<String, dynamic> map) {
//     return QuoteModel(
//       quote: map['quote'] ?? " ",
//       author: map['author'] ?? " ",
//       category: map['category'] ?? " ",
//     );
//   }
// }



// {
//   "quotes": [
//     {
//       "text": "I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best.",
//       "author": "Marilyn Monroe",
//       "tags": [
//         "attributed-no-source",
//         "best",
//         "life",
//         "love",
//         "mistakes",
//         "out-of-control",
//         "truth",
//         "worst"
//       ],
//       "id": 0,
//       "author_id": "Marilyn+Monroe"
//     }
//   ],
//   "pagination": {
//     "page": 1,
//     "page_size": 1,
//     "total": 484280,
//     "pages": 484280,
//     "next": "?page=2&page_size=1"
//   }
// } 