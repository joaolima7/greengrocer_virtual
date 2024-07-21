import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';

abstract class GetSessionDataSource {
  Future<User?> call(String token);
}
