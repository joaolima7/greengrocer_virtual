import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/login_user_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/login_user_usecase/login_user_usecase.dart';

class LoginUserUseCaseImp implements LoginUserUseCase {
  LoginUserRepository _loginUserRepository;
  LoginUserUseCaseImp(this._loginUserRepository);

  @override
  Future<User> call(String email, String password) async {
    return await _loginUserRepository(email, password);
  }
}
