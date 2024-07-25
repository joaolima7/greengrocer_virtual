import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/signup_user_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/signup_user_usecase/signup_user_usecase.dart';

class SignUpUserUseCaseImp implements SignUpUserUseCase {
  SignUpUserRepository _signUpUserRepository;
  SignUpUserUseCaseImp(this._signUpUserRepository);

  @override
  Future<User?> call(User user) async {
    return await _signUpUserRepository(user);
  }
}
