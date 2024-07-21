import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/get_session_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';
import 'package:greengrocer_virtual/src/layers/domain/repositories/user_repositories/get_session_repository.dart';

class GetSessionRepositoryImp implements GetSessionRepository {
  GetSessionDataSource _getSessionDataSource;
  GetSessionRepositoryImp(this._getSessionDataSource);

  @override
  Future<User?> call(String token) async {
    return await _getSessionDataSource(token);
  }
}
