import 'package:flutter/widgets.dart';
import 'package:todo/src/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<User> login({@required String username, @required String password});
}
