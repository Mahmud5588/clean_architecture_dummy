import 'package:clean_architecture_dummy/feauteres/auth/domain/entities/entities.dart';

abstract class AuthRepository {
  Future<User> signIn({required String username, required String password});
}
