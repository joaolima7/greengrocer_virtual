import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/datasources/user_datasources/delete_token_session_datasouce.dart';

class DeleteTokenSessionLocalDataSourceImp
    implements DeleteTokenSessionDataSource {
  final _storage = const FlutterSecureStorage();
  @override
  Future<void> call(String key) async {
    await _storage.delete(key: key);
  }
}
