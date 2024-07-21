import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/get_session_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/get_session_usecase/get_session_usecase.dart';

class GetSessionUseCaseImp implements GetSessionUseCase {
  GetSessionRepository _getSessionRepository;
  GetSessionUseCaseImp(this._getSessionRepository);

  @override
  Future<User?> call(String token) async {
    return await _getSessionRepository(token);
  }
}
