class Endpoints {
  static const String baseUrl =
      'https://mahsoly-app-8ehw-q29vnrq31-mahsoly.vercel.app/';
  static const String signIn = 'auth/login';
  static String signUp = "auth/register";
}

//دي الحاجات الي في ال response
class ApiKey {
  static String name = "name";
  static String email = "email";
  static String password = "password";
  static String access_token = "access_token";
  static String detail = "message";
  static String id = "id";
}
