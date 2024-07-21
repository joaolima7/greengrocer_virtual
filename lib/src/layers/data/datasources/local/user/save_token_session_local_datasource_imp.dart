import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/save_token_session_datasource.dart';

class SaveTokenSessioLocalDataSourceImp implements SaveTokenSessionDataSource {
  final _storage = const FlutterSecureStorage();
  @override
  Future<void> call(String key, String token) async {
    await _storage.write(key: key, value: token);
  }
}
