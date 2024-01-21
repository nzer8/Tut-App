import 'dart:async';

import '../../../base/base_view_model.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInput, LoginViewModelOutput {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  // .broadcast=> mean StreamController has many listener

  ///todo------------->  Inputs
  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  setPassword(String password) {
    throw UnimplementedError();
  }

  @override
  setUserName(String userName) {
    throw UnimplementedError();
  }

  @override
  login() {
    throw UnimplementedError();
  }

  ///todo-------------> Outputs
  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  bool _isPasswordValid(String password) => password.isNotEmpty;
  bool _isUserNameValid(String userName) => userName.isNotEmpty;
}

mixin LoginViewModelInput {
  //view هون لح ندخل الشغلات يلي لح تتواصل مع
  // المستخدم لح يرسل الاسم وكلمة المرور ويضغط الزر
  setUserName(String userName);
  setPassword(String password);
  login();

  //على الحقلين validation  وعنا 2 ستريم واحد للاسم وواحد لكلمة السر لحتى نعمل
  Sink get inputUserName;
  Sink get inputPassword;
}

mixin LoginViewModelOutput {
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
}
