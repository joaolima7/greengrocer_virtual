import 'package:greengrocer_virtual/src/core/utils/consts/endpoints.dart';
import 'package:greengrocer_virtual/src/core/utils/http_manager.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/signup_user_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';

class SignUpUserApiDataSourceImp implements SignUpUserDataSource {
  final _httpManager = HttpManager();

  @override
  Future<User?> call(User user) async {
    try {
      final result = await _httpManager.restRequest(
        url: Endpoints.signUp,
        method: HttpMethods.post,
        body: user.toMap(),
      );

      if (result['result'] != null) {
        return User.fromMap(result['result']);
      } else {
        throw Exception('Erro ao criar usuário, tente novamente mais tarde!');
      }
    } catch (e) {
      throw Exception('Falha ao criar usuário! ${e.toString()}');
    }
  }
}
