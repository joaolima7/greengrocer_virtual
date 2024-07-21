import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/save_token_session_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/save_token_session_usecase/save_token_session_usecase.dart';

class SaveTokenSessionUseCaseImp implements SaveTokenSessionUseCase {
  SaveTokenSessionRepository _saveTokenSessionRepository;
  SaveTokenSessionUseCaseImp(this._saveTokenSessionRepository);

  @override
  Future<void> call(String key, String token) async {
    await _saveTokenSessionRepository(key, token);
  }
}
