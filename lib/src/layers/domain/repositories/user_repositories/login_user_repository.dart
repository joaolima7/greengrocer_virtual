import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';

abstract class LoginUserRepository {
  Future<User> call(String email, String password);
}
