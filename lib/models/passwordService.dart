import 'package:gerador_de_senha/models/routes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PasswordService {
  static Routes routesApi = Routes();

  static Future<String> gerarNewPassWord(
      bool useNumber,
      bool useLetters,
      bool useOnlyNumber,
      bool useOnlyLetters,
      bool withCaracters,
      int lengthPassword) async {
    var url = Uri.parse(
        '${routesApi.urlGet}/api/Security/${lengthPassword.toString()}/${withCaracters.toString()}/${useOnlyNumber.toString()}/${useOnlyLetters.toString()}/${useNumber.toString()}/${useLetters.toString()}');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var password = jsonResponse['data'];
      print("Passwors: " + password);
      return password;
    }
    return "";
  }
}
