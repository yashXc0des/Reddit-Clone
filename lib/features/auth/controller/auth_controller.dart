import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/features/auth/repository/auth_repository.dart';
import 'package:reddit_clone/core/utils.dart';

final AuthControllerProvider = Provider((ref) {
    return AuthController(authRepository: ref.read(AuthRepositoryProvider));
});

class AuthController{
  final AuthRepository _authRepository;
  AuthController({ required AuthRepository authRepository}) :_authRepository=authRepository;
  Future<void> signInWithGoogle(BuildContext context) async {
    final user = await _authRepository.signInWithGoogle();
    user.fold((l)=>showSnackbar(context, l.message),(r)=>null);

  }
}
