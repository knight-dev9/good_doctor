import 'package:intl/intl.dart';
import '../exporter.dart';

class Tools {
  static String formatDate(DateTime dt, String format) {
    DateFormat formatter = DateFormat(format);
    return formatter.format(dt);
  }

  static DateTime formatDateFromString(String dt, String format) {
    DateFormat formatter = DateFormat(format);
    return formatter.parse(dt, false);
  }

  static String formatDateString(
      String dt, String fromFormat, String toFormat) {
    var date = formatDateFromString(dt, fromFormat);
    return formatDate(date, toFormat);
  }

  static void phone(String countryCode, String phone) async {
    String phoneUrl = 'tel:$countryCode$phone';
    if (await canLaunchUrlString(phoneUrl)) {
      await launchUrlString(phoneUrl);
    } else {
      throw 'Could not open phone dialer.';
    }
  }

  static void sendEmail(String email) async {
    String emailUrl = 'mailto:$email';
    if (await canLaunchUrlString(emailUrl)) {
      await launchUrlString(emailUrl);
    } else {
      throw 'Could not open mail app.';
    }
  }

  static void whatsapp(String phone, {String? text}) async {
    String whatsappUrl = 'whatsapp://send?phone=${phone.replaceAll(' ', '')}';
    if (text != null) {
      whatsappUrl = '$whatsappUrl&text=$text';
    }
    if (await canLaunchUrlString(whatsappUrl)) {
      await launchUrlString(whatsappUrl);
    } else {
      throw 'Could not open whatsapp.';
    }
  }

  static void restart() async {
    await ContextHolder.key.currentState?.pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return DoctorPage();
      },
    ), (route) => false);
  }
}

extension BuildContextExtension on BuildContext {
  Map<String, Object> getArguments() {
    final arguments = ModalRoute.of(this)?.settings.arguments;
    if (arguments != null) {
      return arguments as Map<String, Object>;
    }
    return {};
  }
}

extension MapX on Map {
  List<T> getList<T>(String key) {
    if (containsKey(key) && this[key] is List) {
      return (this[key] as List<dynamic>)
          .map((e) => (e as T))
          .toList(growable: true);
    }
    return [];
  }

  double getDouble(String key) {
    if (containsKey(key) && (this[key] is double || this[key] is int)) {
      return this[key].toDouble();
    }
    return 0;
  }

  int getInt(String key) {
    if (containsKey(key) && this[key] is int) {
      return this[key];
    }
    return 0;
  }

  String getString(String key) {
    if (containsKey(key) && this[key] is String) {
      return this[key];
    }
    return '';
  }

  bool getBool(String key) {
    if (containsKey(key) && this[key] is bool) {
      return this[key];
    }
    return false;
  }
}

extension StringX on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  Image toImage({
    double? width,
    double? height,
    Color? color,
    BoxFit? fit,
  }) {
    return Image.asset(
      this,
      width: width,
      height: height,
      color: color,
      fit: fit,
      alignment: Alignment.center,
    );
  }

  Image toIcon({
    double size = 20,
    Color? color,
    BoxFit? fit,
  }) {
    return toImage(
      height: size,
      width: size,
      color: color,
      fit: fit,
    );
  }

  bool get isValidUrl {
    Uri? uri = Uri.tryParse(this);
    return uri != null && (uri.hasScheme && uri.hasAuthority);
  }

  bool hasMatch(String? str, String pattern) {
    return str == null ? false : RegExp(pattern).hasMatch(str);
  }

  bool isEmail() {
    return hasMatch(
      this,
      r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$",
    );
  }
}

extension StateX on State {
  void setStateIfMounted(VoidCallback callback) {
    if (mounted) {
      setState(callback);
    }
  }

  void popUntilFirst() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).popUntil((route) {
        return route.isFirst;
      });
    }
  }
}

class MapUtils {
  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrlString(googleUrl)) {
      await launchUrlString(googleUrl);
    } else {
      throw 'Could not open google map.';
    }
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension DurationX on Duration {
  String format() {
    // Extract hours, minutes, and seconds from the Duration
    final current = isNegative ? Duration.zero : this;
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(current.inMinutes.remainder(60));
    String seconds = twoDigits(current.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}

extension SharedPreferencesX on SharedPreferences {
  Future<bool> setUserId(String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('user_id', value);
  }

  Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id') ?? '';
  }
}
