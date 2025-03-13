import 'package:clean_architecture_dummy/feauteres/auth/domain/entities/entities.dart';
import 'package:clean_architecture_dummy/feauteres/auth/domain/repositories/auth_repository.dart';

class SignInUseCase {
  AuthRepository authRepository;
  SignInUseCase(this.authRepository);
  Future<User> call({required String username, required String password}) {
    return authRepository.signIn(username: username, password: password);
  }
}
