import 'package:loyalty/ropositories/user_repository.dart';
import 'package:loyalty/shared/utils.dart';
import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  UserRepository repo = UserRepository();

  @observable
  dynamic users = {
    "data": {"data": []}
  };

  @observable
  bool loading = false;

  @action
  getUsers(params, context) async {
    loading = true;
    users = await repo.getUsers(params);
    loading = false;
    if (users == null) {
      Utils.showMessage('No user found!', context);
      return;
    }
    return users;
  }
}
