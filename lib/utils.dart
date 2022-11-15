import 'package:intl/intl.dart';

extension DateFormatWithTryParse on DateFormat {
  DateTime? tryParse(String input) {
    try {
      return parse(input);
    } on FormatException {
      return null;
    }
  }
}
