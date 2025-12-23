// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get language => 'Deutsch';

  @override
  String get appTitle => 'Kanban Time Board';

  @override
  String get kanbanTab => 'Kanban';

  @override
  String get kanbanBoard => 'Kanban-Tafel';

  @override
  String get settings => 'Einstellungen';

  @override
  String get languageLabel => 'Sprache';

  @override
  String get markAsCompleted => 'Als abgeschlossen markieren';

  @override
  String get selectLanguage => 'Sprache auswählen';

  @override
  String get toDo => 'Zu erledigen';

  @override
  String get inProgress => 'In Bearbeitung';

  @override
  String get done => 'Fertig';

  @override
  String get completed => 'Abgeschlossen';

  @override
  String get completedTasksTitle => 'Abgeschlossene Aufgaben';

  @override
  String get noCompletedTasksYet => 'Noch keine abgeschlossenen Aufgaben';

  @override
  String get kanbanBoardTitle => 'Kanban-Board';

  @override
  String get taskDetails => 'Aufgabendetails';

  @override
  String comments(int count) {
    return 'Kommentare ($count)';
  }

  @override
  String get noCommentsYet => 'Noch keine Kommentare';

  @override
  String get beTheFirstToComment => 'Sei der Erste, der kommentiert!';

  @override
  String get writeComment => 'Schreibe einen Kommentar...';

  @override
  String get me => 'Ich';

  @override
  String get createTask => 'Aufgabe erstellen';

  @override
  String get editTask => 'Aufgabe bearbeiten';

  @override
  String get title => 'Titel';

  @override
  String get description => 'Beschreibung';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get delete => 'Löschen';

  @override
  String get dropTasksHere => 'Aufgaben hier ablegen';

  @override
  String get justNow => 'Gerade eben';

  @override
  String minutesAgo(int count) {
    return 'vor ${count}m';
  }

  @override
  String hoursAgo(int count) {
    return 'vor ${count}h';
  }

  @override
  String daysAgo(int count) {
    return 'vor ${count}d';
  }

  @override
  String get deleteConfirmation =>
      'Möchten Sie diese Aufgabe wirklich löschen?';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get taskCreated => 'Aufgabe erfolgreich erstellt';

  @override
  String get taskUpdated => 'Aufgabe erfolgreich aktualisiert';

  @override
  String get taskDeleted => 'Aufgabe erfolgreich gelöscht';

  @override
  String get error => 'Fehler';

  @override
  String get loading => 'Lädt...';
}
