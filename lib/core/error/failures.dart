import 'package:equatable/equatable.dart';

/// Base class for all failures
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// Server-related failures
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error occurred']);
}

/// Cache-related failures
class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache error occurred']);
}

/// Network-related failures
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network error occurred']);
}

/// Validation failures
class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Validation failed']);
}
