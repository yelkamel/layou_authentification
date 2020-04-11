import 'package:auth/services/auth.dart';
import 'package:auth/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

enum LoginState {
  Loading,
  NeedCode,
  Init,
}

enum LoginError {
  InvalidCode,
  InvalidFormatEmail,
  None,
}

class LoginModel with ChangeNotifier {
  final Function(String) onSuccess;
  String email;
  LoginState state = LoginState.Init;
  LoginError error = LoginError.None;

  TextEditingController controller = TextEditingController();

  final Auth service = locator.get<Auth>();
  LoginModel({this.onSuccess});

  void back() {
    state = LoginState.Init;
    error = LoginError.None;

    controller = TextEditingController(text: email);
    notifyListeners();
  }

  void submitEmail() async {
    error = LoginError.None;

    if (!StringValidator.isEmailValide(controller.text)) {
      error = LoginError.InvalidFormatEmail;
      notifyListeners();
      return;
    }

    email = controller.text;
    state = LoginState.Loading;
    notifyListeners();

    bool isSignUp = await service.signUp(email);

    if (isSignUp) {
      onSuccess(email);
      return;
    }

    final bool needCode = await service.askCode(email);

    if (needCode) {
      state = LoginState.NeedCode;
      controller.clear();
    }
    notifyListeners();
  }

  Future<bool> submitCode() async {
    error = LoginError.None;
    state = LoginState.Loading;
    notifyListeners();

    bool isConnected = await service.confirmCode(controller.text);

    if (isConnected) {
      onSuccess(email);
    }
    if (!isConnected) {
      state = LoginState.NeedCode;
      error = LoginError.InvalidCode;
    }

    notifyListeners();
  }
}
