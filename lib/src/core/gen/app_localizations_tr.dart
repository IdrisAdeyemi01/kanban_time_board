// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get language => 'Türkçe';

  @override
  String get appTitle => 'Kanban Time Board';

  @override
  String get kanbanTab => 'Kanban';

  @override
  String get kanbanBoard => 'Kanban Panosu';

  @override
  String get settings => 'Ayarlar';

  @override
  String get languageLabel => 'Dil';

  @override
  String get markAsCompleted => 'Tamamlandı olarak işaretle';

  @override
  String get selectLanguage => 'Dil seç';

  @override
  String get toDo => 'Yapılacak';

  @override
  String get inProgress => 'Devam Ediyor';

  @override
  String get done => 'Tamamlandı';

  @override
  String get completed => 'Bitti';

  @override
  String get completedTasksTitle => 'Tamamlanan Görevler';

  @override
  String get noCompletedTasksYet => 'Henüz tamamlanan görev yok!';

  @override
  String get kanbanBoardTitle => 'Kanban Panosu';

  @override
  String get taskDetails => 'Görev Detayları';

  @override
  String comments(int count) {
    return 'Yorumlar ($count)';
  }

  @override
  String get noCommentsYet => 'Henüz yorum yok';

  @override
  String get beTheFirstToComment => 'İlk yorumu sen yap!';

  @override
  String get writeComment => 'Bir yorum yaz...';

  @override
  String get me => 'Ben';

  @override
  String get createTask => 'Görev Oluştur';

  @override
  String get editTask => 'Görevi Düzenle';

  @override
  String get title => 'Başlık';

  @override
  String get description => 'Açıklama';

  @override
  String get cancel => 'İptal';

  @override
  String get save => 'Kaydet';

  @override
  String get delete => 'Sil';

  @override
  String get dropTasksHere => 'Görevleri buraya bırak';

  @override
  String get justNow => 'Az önce';

  @override
  String minutesAgo(int count) {
    return '${count}dk önce';
  }

  @override
  String hoursAgo(int count) {
    return '${count}sa önce';
  }

  @override
  String daysAgo(int count) {
    return '${count}g önce';
  }

  @override
  String get deleteConfirmation =>
      'Bu görevi silmek istediğinizden emin misiniz?';

  @override
  String get yes => 'Evet';

  @override
  String get no => 'Hayır';

  @override
  String get taskCreated => 'Görev başarıyla oluşturuldu';

  @override
  String get taskUpdated => 'Görev başarıyla güncellendi';

  @override
  String get taskDeleted => 'Görev başarıyla silindi';

  @override
  String get error => 'Hata';

  @override
  String get loading => 'Yükleniyor...';
}
