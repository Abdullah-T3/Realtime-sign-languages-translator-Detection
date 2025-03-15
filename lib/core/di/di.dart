import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:realtime_sign_languages_translator/core/helper/FireBase/fire_base_helper.dart';
import 'package:realtime_sign_languages_translator/features/auth/data/apis/fire_base_api.dart';
import 'package:realtime_sign_languages_translator/features/auth/presentation/logic/firebase_auth_cubit.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  // FirebaseAuth instance
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // FirebaseAuthHelper Injection
  getIt.registerLazySingleton<FirebaseAuthHelper>(
    () => FirebaseAuthHelper(firebaseAuth: GetIt.I<FirebaseAuth>()),
  );

  // Register AuthRemoteDataSource
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuthHelper: getIt<FirebaseAuthHelper>(),
    ),
  );

  // Register FirebaseAuthCubit
  getIt.registerFactory<FirebaseAuthCubit>(
    () =>
        FirebaseAuthCubit(authRemoteDataSource: getIt<AuthRemoteDataSource>()),
  );
}
