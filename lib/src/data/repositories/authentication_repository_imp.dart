import 'package:todo/src/domain/entities/user.dart';
import 'package:todo/src/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImp extends AuthenticationRepository {
  AuthenticationRepositoryImp();

  @override
  Future<User> login({String username, String password}) async {
    await Future.delayed(Duration(seconds: 1));
    if (username == 'usuario' && password == 'password') {
      return User(id: 1, username: 'usuario');
    } else {
      return null;
    }
  }
}
