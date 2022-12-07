class Validator {
  static String? inputValidator(String text) {
    if (text.isEmpty) {
      return "Required Input";
    }
    return null;
  }
}
