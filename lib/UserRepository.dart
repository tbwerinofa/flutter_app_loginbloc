import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'Globals.dart';

class UserRepository {
  Future<String> authenticate({
      @required String username,
      @required String password}
      )async{
      String token =null;
      var gettokenuri = new Uri(scheme: 'http',
          host: Globals.apiHost,
          path: '/Token');

      var loginInfo = 'UserName=' + username + '&Password=' + password +
          '&grant_type=password';

      final response = await http
          .post(
          gettokenuri,
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
          body: loginInfo
      );

      if (response.statusCode == 200) {

        print('is success');
        final json = jsonDecode(response.body);
        Globals.token = json['access_token'] as String;

        print( Globals.token);
        token = json['access_token'] as String;
      }
      else {
        final json = jsonDecode(response.body);
      }


   // print(token);
    await Future.delayed(Duration(seconds:1));
        return token;
  }

  Future<void> deleteToken()async{
    ///delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }
  Future<void> persistToken(String token)async{
    ///write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken()async{
    ///write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}