import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/features/auth/repository/auth_repository.dart';
import 'package:reddit_clone/core/utils.dart';
import '../../../model/userModel.dart';

// The userProvider should be a StateProvider if you want to update the state
final userProvider = StateProvider<Usermodel?>((ref) => null);

final AuthControllerProvider = Provider((ref) {
  return AuthController(authRepository: ref.read(AuthRepositoryProvider), ref: ref);
});

class AuthController {
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController({
    required AuthRepository authRepository,
    required Ref ref,
  })  : _authRepository = authRepository,
        _ref = ref;

  Future<void> signInWithGoogle(BuildContext context) async {
    final result = await _authRepository.signInWithGoogle();
    result.fold(
          (failure) => showSnackbar(context, failure.message),
          (userModel) => _ref.read(userProvider.notifier).state = userModel,
    );
  }
}
