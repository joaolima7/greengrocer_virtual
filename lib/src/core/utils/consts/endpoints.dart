const String baseUrl = 'https://parseapi.back4app.com/parse/functions';

abstract class Endpoints {
  //Auth
  static const String signIn = '$baseUrl/login';
  static const String signUp = '$baseUrl/sign-up';
  static const String signOut = '$baseUrl/logout';
  static const String validateSession = '$baseUrl/validate-session';

  //Categories
  static const String getAllCategories = '$baseUrl/getCategories';

  //Items
  static const String getAllItems = '$baseUrl/getItems';
}
