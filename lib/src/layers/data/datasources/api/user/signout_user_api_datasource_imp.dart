import 'package:greengrocer_virtual/src/core/utils/consts/endpoints.dart';
import 'package:greengrocer_virtual/src/core/utils/http_manager.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/signout_user_datasource.dart';

class SignOutUserApiDataSourceImp implements SignOutUserDataSource {
  final _httpManager = HttpManager();

  @override
  Future<void> call(String token) async {
    try {
      final result = await _httpManager.restRequest(
        url: Endpoints.signOut,
        method: HttpMethods.post,
        body: {
          'sessionToken': token,
        },
      );
    } catch (e) {
      throw Exception('Falha ao Sair da Sessão! ${e.toString()}');
    }
  }
}
