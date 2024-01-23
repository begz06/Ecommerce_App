import 'package:equatable/equatable.dart';

class Errors extends Equatable {
  final String message;

  const Errors({this.message = ''});

  @override
  List<Object> get props => [];
}

class ServerErrors extends Errors {
  @override
  final String message;
  final String code;
  final int sec;

  const ServerErrors({this.message = '', this.code = '', this.sec = 0})
      : super(message: message);
}
