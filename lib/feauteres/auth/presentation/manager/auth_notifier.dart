import 'package:clean_architecture_dummy/feauteres/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:clean_architecture_dummy/feauteres/auth/data/repositories/auth_repository_imp.dart';
import 'package:clean_architecture_dummy/feauteres/auth/domain/repositories/auth_repository.dart';
import 'package:clean_architecture_dummy/feauteres/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:clean_architecture_dummy/feauteres/auth/presentation/manager/auth_provider.dart';
import 'package:clean_architecture_dummy/feauteres/auth/presentation/manager/auth_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(authRemoteDataSourceProvider));
});

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(ref.watch(authRepositoryProvider));
});

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(signInUseCase: ref.watch(signInUseCaseProvider));
});
