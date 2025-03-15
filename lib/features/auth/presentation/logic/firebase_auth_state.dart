part of 'firebase_auth_cubit.dart';

@immutable
sealed class FirebaseAuthState {}

final class FirebaseAuthInitial extends FirebaseAuthState {}

final class FirebaseAuthLoading extends FirebaseAuthState {}

final class FirebaseAuthSuccess extends FirebaseAuthState {
  final User user;
  FirebaseAuthSuccess({required this.user});
}

final class FirebaseAuthFailure extends FirebaseAuthState {
  final String message;
  FirebaseAuthFailure({required this.message});
}

final class FirebaseAuthLogout extends FirebaseAuthState {}

final class FirebaseAuthUpdate extends FirebaseAuthState {}
