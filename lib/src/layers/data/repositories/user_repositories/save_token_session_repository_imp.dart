import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/save_token_session_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/save_token_session_repository.dart';

class SaveTokenSessionRepositoryImp implements SaveTokenSessionRepository {
  SaveTokenSessionDataSource _saveTokenSessionDataSource;
  SaveTokenSessionRepositoryImp(this._saveTokenSessionDataSource);

  @override
  Future<void> call(String key, String token) async {
    await _saveTokenSessionDataSource(key, token);
  }
}
