const String baseUrl = 'https://parseapi.back4app.com/parse/functions';

abstract class Endpoints {
  static const String signIn = '$baseUrl/login';
  static const String signUp = '$baseUrl/sign-up';
  static const String signOut = '$baseUrl/logout';
  static const String validateSession = '$baseUrl/validate-session';
}
