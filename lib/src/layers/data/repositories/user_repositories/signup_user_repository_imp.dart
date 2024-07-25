import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/signup_user_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/signup_user_repository.dart';

class SignUpUserRepositoryImp implements SignUpUserRepository {
  SignUpUserDataSource _signUpUserDataSource;
  SignUpUserRepositoryImp(this._signUpUserDataSource);

  @override
  Future<User?> call(User user) async {
    return await _signUpUserDataSource(user);
  }
}
