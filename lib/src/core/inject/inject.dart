import 'package:get_it/get_it.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/api/cart/add_cart_item_api_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/api/cart/get_all_cart_items_api_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/api/cart/remove_cart_item_api_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/api/cart/update_cart_item_api_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/api/item/get_all_category_api_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/api/item/get_all_items_api_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/api/item/get_items_by_category_api_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/api/item/get_items_by_search_api_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/api/user/get_session_api_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/api/user/login_user_api_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/api/user/signout_user_api_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/api/user/signup_user_api_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/cart_datasources/add_cart_item_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/cart_datasources/get_all_cart_items_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/cart_datasources/remove_cart_item_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/cart_datasources/update_cart_item_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/item_datasources/get_all_category_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/item_datasources/get_all_items_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/item_datasources/get_items_by_category_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/item_datasources/get_items_by_search_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/delete_token_session_datasouce.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/get_session_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/get_token_session_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/login_user_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/save_token_session_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/signout_user_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/signup_user_datasource.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/local/user/delete_token_session_local_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/local/user/get_token_session_local_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/local/user/save_token_session_local_datasource_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/cart_repositories/add_cart_item_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/cart_repositories/get_all_cart_items_reository_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/cart_repositories/remove_cart_item_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/cart_repositories/update_cart_item_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/item_repositories/get_all_category_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/item_repositories/get_all_items_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/item_repositories/get_items_by_category_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/item_repositories/get_items_by_search_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/user_repositories/delete_token_session_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/user_repositories/get_session_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/user_repositories/get_token_session_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/user_repositories/login_user_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/user_repositories/save_token_session_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/user_repositories/signout_user_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/data/repositories/user_repositories/signup_user_repository_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/cart_repositories/add_cart_item_respository.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/cart_repositories/get_all_cart_items_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/cart_repositories/remove_cart_item_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/cart_repositories/update_cart_item_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/item_repositories/get_all_category_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/item_repositories/get_all_items_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/item_repositories/get_items_by_category_rpeository.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/item_repositories/get_items_by_search_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/delete_token_session_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/get_session_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/get_token_session_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/login_user_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/save_token_session_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/signout_user_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/signup_user_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/add_cart_item_usecase/add_cart_item_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/add_cart_item_usecase/add_cart_item_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/get_all_cart_items_usecase/get_all_cart_items_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/get_all_cart_items_usecase/get_all_cart_items_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/remove_cart_item_usecase/remove_cart_item_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/remove_cart_item_usecase/remove_cart_item_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/update_cart_item_usecase/update_cart_item_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/cart_usecases/update_cart_item_usecase/update_cart_item_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_all_category_usecase/get_all_category_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_all_category_usecase/get_all_category_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_all_items_usecase/get_all_items_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_all_items_usecase/get_all_items_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_items_by_category_usecase/get_items_by_category_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_items_by_category_usecase/get_items_by_category_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_items_by_search_usecase/get_items_by_search_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_items_by_search_usecase/get_items_by_search_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/delete_token_session_usecase/delete_token_session_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/delete_token_session_usecase/delete_token_session_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/get_session_usecase/get_session_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/get_session_usecase/get_session_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/get_token_session_usecase/get_token_session_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/get_token_session_usecase/get_token_session_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/login_user_usecase/login_user_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/login_user_usecase/login_user_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/save_token_session_usecase/save_token_session_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/save_token_session_usecase/save_token_session_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/signout_user_usecase/signout_user_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/signout_user_usecase/signout_user_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/signup_user_usecase/signup_user_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/signup_user_usecase/signup_user_usecase_imp.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/auth/auth_controller.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/navigation/navigation_controller.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/tabs/cart_tab_controller.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/tabs/home_tab_controller.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //Datasources
    getIt.registerLazySingleton<LoginUserDataSource>(
        () => LoginUserApiDataSourceImp());

    getIt.registerLazySingleton<SaveTokenSessionDataSource>(
        () => SaveTokenSessioLocalDataSourceImp());

    getIt.registerLazySingleton<DeleteTokenSessionDataSource>(
        () => DeleteTokenSessionLocalDataSourceImp());

    getIt.registerLazySingleton<GetTokenSessionDataSource>(
        () => GetTokenSessionLocalDataSourceImp());

    getIt.registerLazySingleton<GetSessionDataSource>(
        () => GetSessionApiDataSourceImp());

    getIt.registerLazySingleton<SignOutUserDataSource>(
        () => SignOutUserApiDataSourceImp());

    getIt.registerLazySingleton<SignUpUserDataSource>(
        () => SignUpUserApiDataSourceImp());

    getIt.registerLazySingleton<GetAllItemsDataSource>(
        () => GetAllItemsApiDataSourceImp());

    getIt.registerLazySingleton<GetAllCategoryDataSource>(
        () => GetAllCategoryApiDataSourceImp());

    getIt.registerLazySingleton<GetItemsByCategoryDataSource>(
        () => GetItemsByCategoryApiDataSourceImp());

    getIt.registerLazySingleton<GetItemsBySearchDataSource>(
        () => GetItemsBySearchApiDataSourceImp());

    getIt.registerLazySingleton<GetAllCartItemsDataSource>(
        () => GetAllCartItemsApiDataSourceImp());

    getIt.registerLazySingleton<UpdateCartItemDataSource>(
        () => UpdateCartItemApiDataSourceImp());

    getIt.registerLazySingleton<AddCartItemDataSource>(
        () => AddCartItemApiDataSourceImp());

    getIt.registerLazySingleton<RemoveCartItemDataSource>(
        () => RemoveCartItemApiDataSourceImp());

    //Repositories
    getIt.registerLazySingleton<LoginUserRepository>(
        () => LoginUserRepositoryImp(getIt()));

    getIt.registerLazySingleton<SaveTokenSessionRepository>(
        () => SaveTokenSessionRepositoryImp(getIt()));

    getIt.registerLazySingleton<DeleteTokenSessionRepository>(
        () => DeleteTokenSessionRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetTokenSessionRepository>(
        () => GetTokenSessionRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetSessionRepository>(
        () => GetSessionRepositoryImp(getIt()));

    getIt.registerLazySingleton<SignOutUserRepository>(
        () => SignOutUserRepositoryImp(getIt()));

    getIt.registerLazySingleton<SignUpUserRepository>(
        () => SignUpUserRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetAllItemsRepository>(
        () => GetAllItemsRepostitoryImp(getIt()));

    getIt.registerLazySingleton<GetAllCategoryRepository>(
        () => GetAllCategoryRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetItemsByCategoryRepository>(
        () => GetItemsByCategoryRespositoryImp(getIt()));

    getIt.registerLazySingleton<GetItemsBySearchRepository>(
        () => GetItemsBySearchRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetAllCartItemsRepository>(
        () => GetAllCartItemsRepositoryImp(getIt()));

    getIt.registerLazySingleton<UpdateCartItemRepository>(
        () => UpdateCartItemRepositoryImp(getIt()));

    getIt.registerLazySingleton<AddCartItemRepository>(
        () => AddCartItemRepositoryImp(getIt()));

    getIt.registerLazySingleton<RemoveCartItemRepository>(
        () => RemoveCartItemRepositoryImp(getIt()));

    //UseCases
    getIt.registerLazySingleton<LoginUserUseCase>(
        () => LoginUserUseCaseImp(getIt()));

    getIt.registerLazySingleton<SaveTokenSessionUseCase>(
        () => SaveTokenSessionUseCaseImp(getIt()));

    getIt.registerLazySingleton<DeleteTokenSessionUseCase>(
        () => DeleteTokenSessionUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetTokenSessionUseCase>(
        () => GetTokenSessionUsecaseImp(getIt()));

    getIt.registerLazySingleton<GetSessionUseCase>(
        () => GetSessionUseCaseImp(getIt()));

    getIt.registerLazySingleton<SignOutUserUseCase>(
        () => SignOutUserUseCaseImp(getIt()));

    getIt.registerLazySingleton<SignUpUserUseCase>(
        () => SignUpUserUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetAllItemsUseCase>(
        () => GetAllItemsUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetAllCategoryUseCase>(
        () => GetAllCategoryUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetItemsByCategoryUseCase>(
        () => GetItemsByCategoryUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetItemsBySearchUseCase>(
        () => GetItemsBySearchUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetAllCartItemsUseCase>(
        () => GetAllCartItemsUseCaseImp(getIt()));

    getIt.registerLazySingleton<UpdateCartItemUseCase>(
        () => UpdateCartItemUseCaseImp(getIt()));

    getIt.registerLazySingleton<AddCartItemUseCase>(
        () => AddCartItemUseCaseImp(getIt()));

    getIt.registerLazySingleton<RemoveCartItemUseCase>(
        () => RemoveCartItemUseCaseImp(getIt()));

    //Controllers
    getIt.registerLazySingleton<NavigationController>(
        () => NavigationController());

    getIt.registerLazySingleton<AuthController>(() => AuthController(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ));

    getIt.registerLazySingleton<HomeTabController>(() => HomeTabController(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ));

    getIt.registerLazySingleton<CartTabController>(() => CartTabController(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ));
  }
}
