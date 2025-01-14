class Validations {
  static String cannotBeEmpty = "This is a required field, cannot be empty.";

  static String? validateText(String name) {
    if (name.isEmpty) {
      return cannotBeEmpty;
    }
    return null;
  }

  static String? validatePhone(String number) {
    if (number.isEmpty) {
      return cannotBeEmpty;
    }
    Validator validator = Validator();
    if (!validator.hasMinNumericChar(number, 10)) {
      return "Phone number must contain exactly 10 digits.";
    }
    return null;
  }
}

class Validator {
  /// Checks if password has minLength
  bool hasMinLength(String password, int minLength) {
    return password.length >= minLength ? true : false;
  }

  /// Checks if password has at least normal char letter matches
  bool hasMinNormalChar(String password, int normalCount) {
    String pattern = '^(.*?[A-Z]){${normalCount.toString()},}';
    return password.toUpperCase().contains(RegExp(pattern));
  }

  /// Checks if password has at least uppercaseCount uppercase letter matches
  bool hasMinUppercase(String password, int uppercaseCount) {
    String pattern = '^(.*?[A-Z]){$uppercaseCount,}';
    return password.contains(RegExp(pattern));
  }

  /// Checks if password has at least lowercaseCount lowercase letter matches
  bool hasMinLowercase(String password, int lowercaseCount) {
    String pattern = '^(.*?[a-z]){$lowercaseCount,}';
    return password.contains(RegExp(pattern));
  }

  /// Checks if password has at least numericCount numeric character matches
  bool hasMinNumericChar(String password, int numericCount) {
    String pattern = '^(.*?[0-9]){$numericCount,}';
    return password.contains(RegExp(pattern));
  }

  //Checks if password has at least specialCount special character matches
  bool hasMinSpecialChar(String password, int specialCount) {
    String pattern =
        r"^(.*?[$&+,\:;/=?@#|'<>.^*()_%!-]){" + specialCount.toString() + ",}";
    return password.contains(RegExp(pattern));
  }
}
