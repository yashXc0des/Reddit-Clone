import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/theme/pallet.dart';

import '../../features/auth/controller/auth_controller.dart';
import '../constants/constants.dart';

class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({super.key});
  void signInWithGoogle(WidgetRef ref) {
    final authController = ref.read(AuthControllerProvider);
    authController.signInWithGoogle();
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: ElevatedButton(
        onPressed: () =>signInWithGoogle(ref),
        style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.greyColor,// Shade of gray for button background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
          minimumSize: const Size(double.infinity, 50), // Width and height of the button
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Constants.googlelogopath,
              height: 24, // Adjust the size of the logo
            ),
            const SizedBox(width: 10), // Add space between logo and text
            const Text(
              "Continue with Google",
              style: TextStyle(fontSize: 16, color: Colors.white), // Text color
            ),
          ],
        ),
      ),
    );
  }
}
