import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  /// Apr 15, 2025
  static const mMMdyyyy = 'hh:mm a, MMM d, yyyy';

  String format(String format) {
    return DateFormat(format).format(this);
  }

  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '$day/$month/$year';
    }
  }
}
