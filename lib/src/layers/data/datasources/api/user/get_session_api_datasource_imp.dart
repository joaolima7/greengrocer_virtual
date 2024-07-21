import 'package:greengrocer_virtual/src/core/utils/consts/endpoints.dart';
import 'package:greengrocer_virtual/src/core/utils/http_manager.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/get_session_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';

class GetSessionApiDataSourceImp implements GetSessionDataSource {
  final _httpManager = HttpManager();
  @override
  Future<User?> call(String token) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.validateSession,
        method: HttpMethods.post,
        body: {
          'sessionToken': token,
        });

    if (result['result'] != null) {
      return User.fromMap(result['result']);
    }
  }
}
