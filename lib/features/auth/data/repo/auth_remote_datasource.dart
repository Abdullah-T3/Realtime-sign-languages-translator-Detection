import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<User?> signUp(String email, String password, String username);
  Future<User?> signIn(String email, String password);
  Future<void> signOut();
  User? getCurrentUser();
  Stream<User?> authStateChanges();
}
