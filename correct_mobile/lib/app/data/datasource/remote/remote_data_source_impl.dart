import 'dart:convert';
import 'dart:developer';
import 'package:mobile_create/app/data/models/address_model.dart';
import 'package:mobile_create/app/domain/entities/adress_entity.dart';
import 'package:mobile_create/app/domain/entities/ordinary_user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobile_create/app/data/datasource/remote/remote_data_source.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<String> loginUser(String cpf, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('https://api-correct-vercel.vercel.app/login-app-user'));
    request.body = json.encode({"document": cpf, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      const String key = 'key';
      const String first = 'first';
      print(responseString);
      Map<String, dynamic> responseMap = jsonDecode(responseString);

      var prefs = await SharedPreferences.getInstance();

      prefs.setString(
        key,
        jsonEncode(
          {
            "token": responseMap['token'],
            "isAuth": true,
          },
        ),
      );

      prefs.setString(
        first,
        jsonEncode(
          {
            "token": responseMap['token'],
            "first": true,
          },
        ),
      );

      log(responseString);
      return 'logedin';
    } else {
      print('socorrooo ${response.statusCode}');
      log(response.reasonPhrase ?? '');
      return 'não';
    }

    // var url = Uri.parse(
    //   'https://vercel-correct-backend.vercel.app/login-app-user',
    // );

    // var response = await http.post(url,
    //     body: jsonEncode(
    //       {"cpf": cpf, "senha": password},
    //     ),
    //     headers: {"Content-Type": "application/json"});
    // Map<String, dynamic> responseMap = jsonDecode(response.body);
    // print(cpf);
    // print(password);
    // print(response.statusCode);
    // print(responseMap);

    // if (response.statusCode == 200) {
    //   const String key = 'key';

    //   var prefs = await SharedPreferences.getInstance();

    //   prefs.setString(
    //     key,
    //     jsonEncode(
    //       {"token": responseMap['token'], "isAuth": true},
    //     ),
    //   );
    //   return 'logedIn';
    // } else {
    //   return responseMap['error'];
    // }
  }

  @override
  Future<String> registerUser(OrdinaryUserEntity ordinaryUserEntity, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('https://api-correct-vercel.vercel.app/app-user'));

    request.body = json.encode({
      "document": ordinaryUserEntity.document,
      "email": ordinaryUserEntity.email,
      "password": password,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      print('aeeeeeeeeeee');
      return 'created';
    } else {
      print("socorrrro ${response.reasonPhrase}");
      return 'not created';
    }
    // print(cpf);
    // print(email);
    // print(password);
    // print(
    //   jsonEncode(
    //     {"cpf": cpf, "email": email, "senha": password},
    //   ),
    // );
    // var url =
    //     Uri.parse('https://vercel-correct-backend.vercel.app/new-app-user');
    // var response = await http.post(url,
    //     body: jsonEncode(
    //       {"cpf": cpf, "email": email, "senha": password},
    //     ),
    //     headers: {"Content-Type": "application/json"});
    // print(response.statusCode);
    // print(response.body);
    // if (response.statusCode == 201) {
    //   return 'created';
    // } else {
    //   return 'erro';
    // }
  }

  @override
  Future<bool> isAuthenticated() async {
    const String key = 'key';
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(key);

    if (jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);
      return mapUser['isAuth'];
    }

    return false;
  }

  @override
  Future<bool> logOut() async {
    try {
      const String key = 'key';
      var prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<AddressEntity?> getAddress(String cep) async {
    try {
      var response = await http.get(
        Uri.parse('https://viacep.com.br/ws/$cep/json'),
      );
      print(response.body);
      return AddressModel.fromViaCep(jsonDecode(response.body));
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return null;
    }
  }
}
