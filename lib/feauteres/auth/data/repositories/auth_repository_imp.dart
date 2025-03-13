import 'package:clean_architecture_dummy/feauteres/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:clean_architecture_dummy/feauteres/auth/domain/entities/entities.dart';
import 'package:clean_architecture_dummy/feauteres/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> signIn({required String username, required String password}) {
    return remoteDataSource.signIn(username: username, password: password);
  }
}
