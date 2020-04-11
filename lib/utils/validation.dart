class StringValidator {
  static bool isEmailValide(String email) {
    if (email.length < 5) {
      return false;
    }

    return true;
  }
}
