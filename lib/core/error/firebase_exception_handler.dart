import 'package:firebase_auth/firebase_auth.dart';

class FirebaseExceptionHandler {
  static String handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'The email is already in use with another account.';
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'operation-not-allowed':
        return 'Operation not allowed. Please contact support.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'user-disabled':
        return 'This user has been disabled. Please contact support.';
      case 'user-not-found':
        return 'No user found for the provided email.';
      case 'wrong-password':
        return 'Incorrect password provided for the email.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      default:
        return 'An undefined Error happened: ${e.message}';
    }
  }
}
