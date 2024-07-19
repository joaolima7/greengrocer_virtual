import 'package:get_it/get_it.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/api/user/login_user_api_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/user_datasources/login_user_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/user_repositories/login_user_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/login_user_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/login_user_usecase/login_user_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/login_user_usecase/login_user_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/auth/auth_controller.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //Datasources
    getIt.registerLazySingleton<LoginUserDataSource>(
        () => LoginUserApiDataSourceImp());

    //Repositories
    getIt.registerLazySingleton<LoginUserRepository>(
        () => LoginUserRepositoryImp(getIt()));

    //UseCases
    getIt.registerLazySingleton<LoginUserUseCase>(
        () => LoginUserUseCaseImp(getIt()));

    //Controllers
    getIt.registerFactory<AuthController>(() => AuthController(
          getIt(),
        ));
  }
}
