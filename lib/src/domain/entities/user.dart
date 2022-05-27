import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String username;
  final String password;
  const User({this.id, this.username, this.password});

  User copyWith({
    int id,
    String username,
    String password,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [id, username, password];
}
