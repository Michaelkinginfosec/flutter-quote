import 'package:share_plus/share_plus.dart';

class ShareUtils {
  static void shareQuote(String quote, String author) {
    Share.share(
      '"$quote" - $author',
      subject: 'Inspirational Quote',
    );
  }
}
