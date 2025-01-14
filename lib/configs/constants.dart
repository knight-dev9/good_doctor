import '../exporter.dart';

class Constants {
  static String get baseUrl {
    return dotenv.get('BASE_URL');
  }

  static String get authToken {
    return dotenv.get('AUTH_TOKEN');
  }

  static Map<String, String> get headers {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken'
    };
  }

  static Map<String, String> get multipartHeaders {
    return {
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $authToken'
    };
  }

  static String login = 'features/login-otp/';
  static String register = 'features/register/';
  static String verifyOtp = 'features/verify-otp/';
  static String resendOtp = 'features/request-otp/';
  static String getAllPreferences = 'features/get-master-preferences/';
  static String getUserPreferences = 'features/get-user-preferences/';
  static String saveUserPreferences = 'features/save-user-preferences/';
  static String updateUserPreferences = 'features/update-user-preferences/';
  static String getScanStatus = 'features/get-scan-status/';
  static String getRecipes = 'features/get-recipes/';
  static String getRecipeDetail = 'features/get-recipe-by-id/';
  static String getScans = 'features/get-all-scans/';
  static String getMealType = 'features/get-meal-type/';
  static String getBanner = 'features/get-banner-image/';
  static String getHealthQuote = 'features/get-personalised-health-quote/';
  static String uploadScan = 'features/upload-image/';
  static String getContactUs = 'features/get-contact-us-url/';
  static String deleteAccount = 'features/collect-delete-account-details/';
  static String requestMoreScans = 'features/request-more-scans/';
  static String getRecord = 'features/get-audio-file-url/';

  static double bannerAspectRatio = 345 / 165;
  static double recipeAspectRatio = 375 / 228;
}
