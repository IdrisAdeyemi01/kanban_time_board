import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_time_board/src/features/settings/data/services/local_storage/local_storage_service.dart';

part 'l10n_event.dart';
part 'l10n_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(const LocalizationState()) {
    on<LoadLocalizationEvent>(_onLoadLocalizationEvent);
    on<ChangeLocalizationEvent>(_onChangeLocalizationEvent);

    add(const LoadLocalizationEvent());
  }

  final _localStorageService = LocalStorageService.getInstance();

  Future<void> _onLoadLocalizationEvent(
    LoadLocalizationEvent event,
    Emitter<LocalizationState> emit,
  ) async {
    try {
      final savedLanguageCode = await _localStorageService.getLanguage();
      if (savedLanguageCode != null && _isSupported(savedLanguageCode)) {
        emit(LocalizationState(selectedLocal: savedLanguageCode));
      }
    } catch (e) {
      emit(const LocalizationState(selectedLocal: 'en'));
    }
  }

  Future<void> _onChangeLocalizationEvent(
    ChangeLocalizationEvent event,
    Emitter<LocalizationState> emit,
  ) async {
    try {
      await _localStorageService.setLanguage(Locale(event.selectedLocal));

      emit(LocalizationState(selectedLocal: event.selectedLocal));
    } catch (e) {
      // Handle error if needed
    }
  }

  bool _isSupported(String languageCode) {
    return ['en', 'de', 'tr'].contains(languageCode);
  }
}
