import 'package:clean_architecture_dummy/feauteres/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:clean_architecture_dummy/feauteres/auth/presentation/manager/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final SignInUseCase signInUseCase;

  AuthNotifier({required this.signInUseCase}) : super(AuthInitial());

  Future<void> signIn(String username, String password) async {
    try {
      state = AuthLoading();
      final user = await signInUseCase(username: username, password: password);
      state = AuthSuccess(user);
    } catch (e) {
      state = AuthError(e.toString());
    }
  }
}
