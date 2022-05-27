import 'package:flutter_test/flutter_test.dart';
import 'package:todo/src/domain/entities/user.dart';
import 'package:todo/src/ui/pages/signin/cubit/signin_cubit.dart';

import '../dependency_injection.dart';

void main() {
  SigninCubit signinCubit;
  setUpAll(() async {
    await TestDependencyInjection.initialize();
    signinCubit = SigninCubit();
  });
  tearDownAll(() {
    TestDependencyInjection.clear();
  });
  group('SignInCubit => ', () {
    test('setUsername', () {
      expect(signinCubit.state.username, '');
      signinCubit.setUsername("usuario");
      expect(signinCubit.state.username, 'usuario');
    });

    test('setPassword', () {
      expect(signinCubit.state.password, '');
      signinCubit.setPassword("password");
      expect(signinCubit.state.password, 'password');
    });

    test('Login Fail', () async {
      signinCubit.setUsername("usuario");
      signinCubit.setPassword("mal");
      final user = await signinCubit.login();
      expect(user == null, true);
    });

    test('Login Success', () async {
      signinCubit.setUsername("usuario");
      signinCubit.setPassword("password");
      final user = await signinCubit.login();
      expect(user, isA<User>());
    });
  });
}
