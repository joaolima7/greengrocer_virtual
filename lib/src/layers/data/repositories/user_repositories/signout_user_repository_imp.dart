import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/signout_user_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/signout_user_repository.dart';

class SignOutUserRepositoryImp implements SignOutUserRepository {
  SignOutUserDataSource _signOutUserDataSource;
  SignOutUserRepositoryImp(this._signOutUserDataSource);

  @override
  Future<void> call(String token) async {
    return await _signOutUserDataSource(token);
  }
}
