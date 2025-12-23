import 'package:flutter/material.dart';
import 'package:kanban_time_board/src/core/gen/app_localizations.dart';
import 'package:kanban_time_board/src/core/gen/app_localizations_en.dart';

extension BuildContextExt on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  ThemeData get theme => Theme.of(this);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  AppLocalizations get l10n =>
      AppLocalizations.of(this) ??
      AppLocalizationsEn(); // Fallback to English if localization is not found
}
