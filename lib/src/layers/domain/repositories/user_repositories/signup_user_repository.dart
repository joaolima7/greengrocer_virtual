import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';

abstract class SignUpUserRepository {
  Future<User?> call(User user);
}
