import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final int statusCode;
  final String statusMessage;

  ServerFailure({
    required this.statusCode,
    required this.statusMessage,
  });
}

class LocalFailure extends Failure {
  final String statusMessage;

  LocalFailure({
    required this.statusMessage,
  });
}