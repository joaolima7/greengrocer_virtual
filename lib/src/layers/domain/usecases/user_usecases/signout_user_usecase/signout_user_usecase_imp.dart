import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/signout_user_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/signout_user_usecase/signout_user_usecase.dart';

class SignOutUserUseCaseImp implements SignOutUserUseCase {
  SignOutUserRepository _signOutUserRepository;
  SignOutUserUseCaseImp(this._signOutUserRepository);

  @override
  Future<void> call(String token) async {
    return await _signOutUserRepository(token);
  }
}
