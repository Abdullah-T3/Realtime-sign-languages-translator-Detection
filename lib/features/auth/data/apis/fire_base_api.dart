import 'package:firebase_auth/firebase_auth.dart';
import 'package:realtime_sign_languages_translator/core/helper/FireBase/fire_base_helper.dart';

abstract class AuthRemoteDataSource {
  Future<User?> signUp(String email, String password, String username);
  Future<User?> signIn(String email, String password);
  Future<void> signOut();
  User? getCurrentUser();
  Stream<User?> authStateChanges();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuthHelper firebaseAuthHelper;

  AuthRemoteDataSourceImpl({required this.firebaseAuthHelper});

  @override
  Future<User?> signUp(String email, String password, String username) async {
    return await firebaseAuthHelper.signUp(email, password, username);
  }

  @override
  Future<User?> signIn(String email, String password) async {
    return await firebaseAuthHelper.signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    await firebaseAuthHelper.signOut();
  }

  @override
  User? getCurrentUser() {
    return firebaseAuthHelper.getCurrentUser();
  }

  @override
  Stream<User?> authStateChanges() {
    return firebaseAuthHelper.authStateChanges();
  }
}
