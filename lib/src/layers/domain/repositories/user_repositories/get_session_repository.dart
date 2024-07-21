import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';

abstract class GetSessionRepository {
  Future<User?> call(String token);
}
