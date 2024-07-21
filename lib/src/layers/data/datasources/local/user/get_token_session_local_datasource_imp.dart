import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/get_token_session_datasource.dart';

class GetTokenSessionLocalDataSourceImp implements GetTokenSessionDataSource {
  final _secure = const FlutterSecureStorage();
  @override
  Future<String?> call(String key) async {
    return await _secure.read(key: key);
  }
}
