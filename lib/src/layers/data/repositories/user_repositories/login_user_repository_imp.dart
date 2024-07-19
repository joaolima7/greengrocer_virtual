import 'package:greengrocer_virtual/src/layers/data/datasources/user_datasources/login_user_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/login_user_repository.dart';

class LoginUserRepositoryImp implements LoginUserRepository {
  LoginUserDataSource _loginUserDataSource;
  LoginUserRepositoryImp(this._loginUserDataSource);
  @override
  Future<User> call(String email, String password) async {
    return await _loginUserDataSource(email, password);
  }
}
