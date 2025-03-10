import '../exporter.dart';

class Constants {
  static String get baseUrl {
    return dotenv.get('BASE_URL');
  }
}
