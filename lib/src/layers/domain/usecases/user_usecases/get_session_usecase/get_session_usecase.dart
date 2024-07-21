import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';

abstract class GetSessionUseCase {
  Future<User?> call(String token);
}
