import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/get_token_session_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/get_token_session_usecase/get_token_session_usecase.dart';

class GetTokenSessionUsecaseImp implements GetTokenSessionUseCase {
  GetTokenSessionRepository _getTokenSessionRepository;
  GetTokenSessionUsecaseImp(this._getTokenSessionRepository);

  @override
  Future<String?> call(String key) async {
    return await _getTokenSessionRepository(key);
  }
}
