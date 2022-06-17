import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final int statusCode;
  final String statusMessage;
  final bool success;

  ServerFailure({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });
}