import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:realtime_sign_languages_translator/features/auth/data/repo/auth_remote_datasource.dart';

part 'firebase_auth_state.dart';

class FirebaseAuthCubit extends Cubit<FirebaseAuthState> {
  final AuthRemoteDataSource authRemoteDataSource;

  FirebaseAuthCubit({required AuthRemoteDataSource authRemoteDataSource})
    : authRemoteDataSource = GetIt.instance<AuthRemoteDataSource>(),
      super(FirebaseAuthInitial());

  Future<void> signIn(String email, String password) async {
    emit(FirebaseAuthLoading());
    try {
      User? user = await authRemoteDataSource.signIn(email, password);
      if (user != null) {
        emit(FirebaseAuthSuccess(user: user));
      } else {
        emit(FirebaseAuthFailure(message: 'User sign-in failed'));
      }
    } catch (e) {
      emit(FirebaseAuthFailure(message: e.toString()));
    }
  }

  Future<void> signUp(String email, String password, String username) async {
    emit(FirebaseAuthLoading());
    try {
      User? user = await authRemoteDataSource.signUp(email, password, username);
      if (user != null) {
        emit(FirebaseAuthSuccess(user: user));
      } else {
        emit(FirebaseAuthFailure(message: 'User sign-up failed'));
      }
    } catch (e) {
      emit(FirebaseAuthFailure(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    await authRemoteDataSource.signOut();
    emit(FirebaseAuthInitial());
  }
}
