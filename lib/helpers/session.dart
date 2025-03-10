import '../exporter.dart';

class Session {
  static const String _user = 'user';
  static const String _language = 'language';

  static Future<SharedPreferences> _shared() {
    return SharedPreferences.getInstance();
  }

  static Future<bool> setUser(Map<String, dynamic> user) async {
    final prefs = await _shared();
    return await prefs.setString(_user, jsonEncode(user));
  }

  static Future<bool> setUserId(String userId) async {
    return setUser({
      'userId': userId,
    });
  }

  static Future<Map<String, dynamic>> getUser() async {
    final prefs = await _shared();
    String json = prefs.getString(_user) ?? '';
    if (json.isNotEmpty) {
      return await jsonDecode(json);
    }
    return {};
  }

  static Future<String> getUserId() async {
    return (await getUser()).getString('userId');
  }

  static Future<Locale> setLanguage(String languageCode) async {
    final prefs = await _shared();
    await prefs.setString(_language, languageCode);
    return Localizer.findLocale(languageCode);
  }

  static Future<Locale> getLanguage() async {
    final prefs = await _shared();
    final languageCode = prefs.getString(_language);
    return Localizer.findLocale(languageCode);
  }

  static Future<bool> clear() async {
    final prefs = await _shared();
    return await prefs.clear();
  }
}
