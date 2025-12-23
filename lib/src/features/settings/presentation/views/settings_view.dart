import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_time_board/src/features/settings/presentation/bloc/l10n_bloc.dart';
import 'package:kanban_time_board/src/features/settings/domain/models/language.dart';
import 'package:kanban_time_board/src/shared/widgets/app_dropdown_input.dart';
import 'package:kanban_time_board/src/core/extensions/context_extension.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  Language? _selectedLanguage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settings)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AppDropdownInput<Language>(
              labelText: context.l10n.languageLabel,
              hintText: context.l10n.selectLanguage,
              options: Language.languageList(),
              value: _selectedLanguage,
              getLabel: (Language? language) =>
                  language?.name ?? context.l10n.language,
              onChanged: (Language? language) {
                setState(() {
                  _selectedLanguage = language;
                });
                context.read<LocalizationBloc>().add(
                  ChangeLocalizationEvent(language?.languageCode ?? 'en'),
                );
              },
              prefixIcon: const Icon(Icons.language, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
