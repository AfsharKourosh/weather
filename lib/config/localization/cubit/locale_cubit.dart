/*
class LocaleCubit extends Cubit<Locale?> {
  LocaleCubit(this._storage) : super(null);

  final LocalStorage _storage;

  static const _localeKey = 'locale';

  Future<void> loadLocale() async {
    final languageCode = _storage.getString(_localeKey);

    if (languageCode == null) {
      emit(null);
      return;
    }

    emit(Locale(languageCode));
  }

  Future<void> setLocale(Locale locale) async {
    await _storage.setString(
      _localeKey,
      locale.languageCode,
    );

    emit(locale);
  }

  Future<void> useSystemLocale() async {
    await _storage.remove(_localeKey);
    emit(null);
  }
}




root in  l10n.yaml 

arb-dir: lib/config/language
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
*/