import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/get_token_session_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/get_token_session_repository.dart';

class GetTokenSessionRepositoryImp implements GetTokenSessionRepository {
  GetTokenSessionDataSource _getTokenSessionDataSource;
  GetTokenSessionRepositoryImp(this._getTokenSessionDataSource);

  @override
  Future<String?> call(String key) async {
    return await _getTokenSessionDataSource(key);
  }
}
