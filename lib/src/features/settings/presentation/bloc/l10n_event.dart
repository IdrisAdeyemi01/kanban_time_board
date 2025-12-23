part of 'l10n_bloc.dart';

abstract class LocalizationEvent {
  const LocalizationEvent();
}

class LoadLocalizationEvent extends LocalizationEvent {
  const LoadLocalizationEvent();
}

class ChangeLocalizationEvent extends LocalizationEvent {
  const ChangeLocalizationEvent(this.selectedLocal);
  final String selectedLocal;
}
