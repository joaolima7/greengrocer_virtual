import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/delete_token_session_repository.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/delete_token_session_usecase/delete_token_session_usecase.dart';

class DeleteTokenSessionUseCaseImp implements DeleteTokenSessionUseCase {
  DeleteTokenSessionRepository _deleteTokenSessionRepository;
  DeleteTokenSessionUseCaseImp(this._deleteTokenSessionRepository);

  @override
  Future<void> call(String key) async {
    await _deleteTokenSessionRepository(key);
  }
}
