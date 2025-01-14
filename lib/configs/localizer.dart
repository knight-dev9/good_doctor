import '../exporter.dart';

class Localizer {
  Map<String, String> _strings = {};

  Localizer();

  static const localeEnglish = Locale('en', 'US');

  Future<void> load(Locale locale) async {
    String jsonString = await rootBundle.loadString(
      'assets/strings/${locale.languageCode}.json',
    );
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _strings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  String? find(String key) {
    return _strings[key];
  }

  static const supportedLocales = [localeEnglish];

  static final List<LocalizationsDelegate> delegates = [
    LocalizerDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate
  ];

  static Locale supportedLocale(
      Iterable<Locale> supportedLocales, Locale? locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale?.languageCode &&
          supportedLocale.countryCode == locale?.countryCode) {
        return supportedLocale;
      }
    }
    // If the locale of the device is not supported, use the first one
    // from the list (English, in this case).
    return supportedLocales.first;
  }

  static Locale findLocale(String? languageCode) {
    switch (languageCode) {
      case 'en':
        return localeEnglish;
      default:
        return localeEnglish;
    }
  }

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static Localizer? findLocalizer(BuildContext context) {
    return Localizations.of<Localizer>(context, Localizer);
  }
}

class LocalizerDelegate extends LocalizationsDelegate<Localizer> {
  static final LocalizerDelegate _instance = LocalizerDelegate.internal();

  factory LocalizerDelegate() => _instance;

  LocalizerDelegate.internal();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<Localizer> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    Localizer localizer = Localizer();
    await localizer.load(locale);
    return localizer;
  }

  @override
  bool shouldReload(LocalizerDelegate old) {
    return old != this;
  }
}

extension BuildContextX on BuildContext {
  Localizer? get localizer {
    return Localizer.findLocalizer(this);
  }

  String text(String key) {
    return localizer?.find(key) ?? 'key: $key';
  }
}
