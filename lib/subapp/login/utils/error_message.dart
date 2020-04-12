import '../model.dart';

class ErrorMessage {
  static String loginError(LoginError error) {
    switch (error) {
      case LoginError.InvalidCode:
        return 'Code invalide';
      default:
        return 'Email pas correct';
    }
  }
}
