import 'package:auth/subapp/login/model.dart';

class ErrorMessage {
  static String loginError(LoginError error) {
    switch (error) {
      case LoginError.EmailHasBeenSend:
        return 'Email a été envoyer via bonjour@evolum.co';
      case LoginError.InvalidCode:
        return 'Code invalide';
      default:
        return 'Email pas correct';
    }
  }
}
