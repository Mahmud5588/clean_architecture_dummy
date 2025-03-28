import 'package:clean_architecture_dummy/feauteres/auth/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;
  AuthSuccess(this.user);
  @override
  List<Object?> get props => [user];
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
  @override
  List<Object?> get props => [message];
}
