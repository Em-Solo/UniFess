import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:unifess/view_models/login_page_vm/login_page_cubit.dart';

import 'models/services/authentication/auth_service.dart';
import 'models/services/authentication/firebase_auth_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Packages
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Services
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService(
        locator.get<FirebaseAuth>(),
      ));

  // Repositories

  // Cubits
  locator.registerFactory(() => LoginPageCubit(
        locator.get<AuthService>(),
      ));
}
