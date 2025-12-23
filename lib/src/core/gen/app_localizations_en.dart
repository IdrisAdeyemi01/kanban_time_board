// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get appTitle => 'Kanban Time Board';

  @override
  String get kanbanTab => 'Kanban';

  @override
  String get kanbanBoard => 'Kanban Board';

  @override
  String get settings => 'Settings';

  @override
  String get languageLabel => 'Language';

  @override
  String get markAsCompleted => 'Mark as completed';

  @override
  String get selectLanguage => 'Select language';

  @override
  String get toDo => 'To Do';

  @override
  String get inProgress => 'In Progress';

  @override
  String get done => 'Done';

  @override
  String get completed => 'Completed';

  @override
  String get completedTasksTitle => 'Completed Tasks';

  @override
  String get noCompletedTasksYet => 'No completed tasks yet!';

  @override
  String get kanbanBoardTitle => 'Kanban Board';

  @override
  String get taskDetails => 'Task Details';

  @override
  String comments(int count) {
    return 'Comments ($count)';
  }

  @override
  String get noCommentsYet => 'No comments yet';

  @override
  String get beTheFirstToComment => 'Be the first to comment!';

  @override
  String get writeComment => 'Write a comment...';

  @override
  String get me => 'Me';

  @override
  String get createTask => 'Create Task';

  @override
  String get editTask => 'Edit Task';

  @override
  String get title => 'Title';

  @override
  String get description => 'Description';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get dropTasksHere => 'Drop tasks here';

  @override
  String get justNow => 'Just now';

  @override
  String minutesAgo(int count) {
    return '${count}m ago';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h ago';
  }

  @override
  String daysAgo(int count) {
    return '${count}d ago';
  }

  @override
  String get deleteConfirmation => 'Are you sure you want to delete this task?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get taskCreated => 'Task created successfully';

  @override
  String get taskUpdated => 'Task updated successfully';

  @override
  String get taskDeleted => 'Task deleted successfully';

  @override
  String get error => 'Error';

  @override
  String get loading => 'Loading...';
}
