class Validator {
  static String? inputValidator(String text) {
    if (text.isEmpty) {
      return "Required Input";
    }
    return null;
  }

  static String? phoneNumberInputValidator(String text) {
    if (text.length != 10) {
      return "Phone Number Must be 10 Character";
    }
    return null;
  }

  static String? emailInputValidator(String text) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text)) {
      return null;
    }
    return "Email Not Valid";
  }


   static String? birthInputValidator(String text , int length) {
    if (text.length != length) {
      return "Must be $length Character";
    }
    return null;
  }
}
