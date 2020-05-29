class Globals {
  static String token; //oauth token
  static String scheme = 'http';
  static String apiHost = '18.202.141.241';
  static String requestPath = '/api/request/';
  static String authorization = 'Bearer ' + Globals.token;
}

class HttpUrl {
  static String accountForgotPath = '/api/accountmanager/forgotpassword';
  static String getUser = '/api/accountmanager/get';
  static String projectPath = '/api/project/';
  static String documentPath = '/api/document/';
}
