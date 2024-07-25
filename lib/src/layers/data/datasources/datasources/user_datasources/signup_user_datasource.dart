import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';

abstract class SignUpUserDataSource {
  Future<User?> call(User user);
}
