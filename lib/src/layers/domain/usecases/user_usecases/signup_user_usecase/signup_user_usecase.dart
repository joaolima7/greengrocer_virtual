import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';

abstract class SignUpUserUseCase {
  Future<User?> call(User user);
}
