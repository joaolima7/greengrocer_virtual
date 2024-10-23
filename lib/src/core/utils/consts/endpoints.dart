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
  static const String getItemsByCategory = '$baseUrl/getItemsByCategory';
  static const String getItemsBySearch = '$baseUrl/getItemsByName';

  //Cart
  static const String getAllCartItems = '$baseUrl/getCartItems';
  static const String updateCartItem = '$baseUrl/updateCartItem';
  static const String addCartItem = '$baseUrl/addCartItem';
  static const String removeCartItem = '$baseUrl/removeCartItem';
}
