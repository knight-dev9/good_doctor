import '../exporter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(Locale newLocale) {
    final state =
    ContextHolder.currentContext.findAncestorStateOfType<_MyAppState>();
    state?._locale.value = newLocale;
  }
}

class _MyAppState extends State<MyApp> {
  final ValueNotifier<Locale> _locale = ValueNotifier(Localizer.localeEnglish);

  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    WidgetsBinding.instance.addPostFrameCallback(onCreate);
  }

  onCreate(_) async {
    Session.getLanguage().then((value) => _locale.value = value);
  }

  @override
  void dispose() {
    _locale.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _locale,
      builder: (context, value, child) => body(value),
    );
  }

  Widget body(Locale locale) {
    return MaterialApp(
      title: context.text('appName'),
      debugShowCheckedModeBanner: false,
      navigatorKey: ContextHolder.key,
      locale: locale,
      theme: ThemeData(
        appBarTheme: Themes.appBarTheme,
        textButtonTheme: Themes.textButtonTheme,
        outlinedButtonTheme: Themes.outlinedButtonTheme,
        textSelectionTheme: Themes.textSelectionTheme,
        progressIndicatorTheme: Themes.circularIndicatorTheme,
        navigationBarTheme: Themes.navigationBarTheme,
        tabBarTheme: Themes.tabBarTheme,
        snackBarTheme: Themes.snackBarTheme,
        floatingActionButtonTheme: Themes.floatingActionButtonTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: Palette.primaryColor),
        primaryColor: Palette.primaryColor,
        scaffoldBackgroundColor: Palette.whiteColor,
        useMaterial3: true,
      ),
      supportedLocales: Localizer.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        return Localizer.supportedLocale(supportedLocales, locale);
      },
      localizationsDelegates: Localizer.delegates,
      home: DoctorPage(),
    );
  }
}
