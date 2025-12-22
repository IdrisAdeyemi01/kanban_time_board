import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  /// Apr 15, 2025
  static const mMMdyyyy = 'MMM d, yyyy';

  String format(String format) {
    return DateFormat(format).format(this);
  }
}
