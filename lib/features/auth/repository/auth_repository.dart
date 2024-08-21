import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reddit_clone/core/constants/firebaseConstants.dart';
import 'package:reddit_clone/core/constants/type_def.dart';
import 'package:reddit_clone/core/failure.dart';
import 'package:reddit_clone/core/provider/providers.dart';
import 'package:reddit_clone/model/userModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../core/constants/constants.dart';

final AuthRepositoryProvider = Provider((ref) => AuthRepository(
  auth: ref.read(authProvider),
  googleSignIn: ref.read(googleSignInProvider),
  firestore: ref.read(firestoreProvider),
));

class AuthRepository {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  AuthRepository({
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _googleSignIn = googleSignIn,
        _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  FutureEither<Usermodel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(Failure('Google sign-in was canceled.'));
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      // Initialize usermodel with default or existing user data
      Usermodel usermodel = Usermodel(
        name: userCredential.user!.displayName ?? 'No Name',
        profilePic: userCredential.user!.photoURL ?? Constants.avatarDefault,
        banner: Constants.bannerDefault,
        Uid: userCredential.user!.uid,
        isAunthenticated: true,
        karma: 0,
        awards: [],
      );

      if (userCredential.additionalUserInfo!.isNewUser) {
        await _users.doc(userCredential.user!.uid).set(usermodel.toMap());
      } else {
        // Optionally, fetch the user model from Firestore if it's an existing user
        final doc = await _users.doc(userCredential.user!.uid).get();
        if (doc.exists) {
          usermodel = Usermodel.fromMap(doc.data() as Map<String, dynamic>);
        }
      }

      print(userCredential.user!.displayName);
      return right(usermodel);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
