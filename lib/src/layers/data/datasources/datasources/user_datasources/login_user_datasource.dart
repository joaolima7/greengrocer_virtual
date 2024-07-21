import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';

abstract class LoginUserDataSource {
  Future<User> call(String email, String password);
}
