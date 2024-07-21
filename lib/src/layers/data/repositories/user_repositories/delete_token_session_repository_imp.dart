import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/delete_token_session_datasouce.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/delete_token_session_repository.dart';

class DeleteTokenSessionRepositoryImp implements DeleteTokenSessionRepository {
  DeleteTokenSessionDataSource _deleteTokenSessionDataSource;
  DeleteTokenSessionRepositoryImp(this._deleteTokenSessionDataSource);

  @override
  Future<void> call(String key) async {
    await _deleteTokenSessionDataSource(key);
  }
}
