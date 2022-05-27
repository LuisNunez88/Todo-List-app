import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/src/domain/entities/user.dart';
import 'package:todo/src/domain/repositories/authentication_repository.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninState());
  final _authenticationRepository = GetIt.I<AuthenticationRepository>();

  void setUsername(String username) {
    emit(state.copyWith(username: username));
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }

  Future<User> login() async {
    emit(state.copyWith(isLoading: true));
    final response = await _authenticationRepository.login(
        username: state.username, password: state.password);
    emit(state.copyWith(isLoading: false));
    return response;
  }
}
