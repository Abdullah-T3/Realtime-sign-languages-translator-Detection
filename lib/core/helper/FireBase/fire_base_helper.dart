import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:realtime_sign_languages_translator/core/error/firebase_exception_handler.dart';

final getIt = GetIt.instance;

class FirebaseAuthHelper {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthHelper({required this.firebaseAuth});

  // Sign up with email, password, and username
  Future<User?> signUp(String email, String password, String username) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user!.updateDisplayName(username);
      await userCredential.user!.reload();

      return firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler.handleFirebaseAuthException(e);
    }
  }

  // Sign in with email and password
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler.handleFirebaseAuthException(e);
    }
  }

  // Sign out
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  // Get current user
  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }

  // Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler.handleFirebaseAuthException(e);
    }
  }

  // Auth state changes stream
  Stream<User?> authStateChanges() {
    return firebaseAuth.authStateChanges();
  }
}
