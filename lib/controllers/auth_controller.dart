import 'package:loyalty/ropositories/authentication_repository.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  AuthenticationRepository auth = AuthenticationRepository();

  login(email, password) async {
    Map<String, dynamic> data = {"email": email, "password": password};
    dynamic res = await auth.login(data);
  }
}
