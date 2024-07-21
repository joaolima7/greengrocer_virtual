import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:greengrocer_virtual/src/core/utils/consts/endpoints.dart';
import 'package:greengrocer_virtual/src/core/utils/http_manager.dart';
import 'package:greengrocer_virtual/src/core/utils/utils_dialogs.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/login_user_datasource.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';

class LoginUserApiDataSourceImp implements LoginUserDataSource {
  final HttpManager _httpManager = HttpManager();

  @override
  Future<User> call(String email, String password) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signIn,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (result['result'] != null) {
      return User.fromMap(result['result']);
    } else if (result['code'] == 101) {
      throw Exception('Usuário e/ou Senha incorretos!');
    } else {
      throw Exception('Falha ao efetuar login! Tente mais tarde.');
    }
  }
}
