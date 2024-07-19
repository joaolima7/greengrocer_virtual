abstract class SaveTokenSessionRepository {
  Future<void> call(String key, String token);
}
