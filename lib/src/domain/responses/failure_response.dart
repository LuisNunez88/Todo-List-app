import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure({this.message = ''});

  @override
  List<Object> get props => [message];
}

class DataBaseFailure extends Failure {
  const DataBaseFailure(message)
      : super(message: message ?? 'Failed to get database information');
}
