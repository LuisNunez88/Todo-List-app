part of 'signin_cubit.dart';

class SigninState extends Equatable {
  final String username;
  final String password;
  final bool isLoading;
  const SigninState({
    this.isLoading = false,
    this.username = '',
    this.password = '',
  });

  SigninState copyWith({
    bool isLoading,
    String username,
    String password,
  }) =>
      SigninState(
        username: username ?? this.username,
        password: password ?? this.password,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [isLoading, username, password];
}
