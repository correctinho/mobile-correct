import 'dart:convert';
import 'dart:developer';
import 'package:mobile_create/app/data/models/address_model.dart';
import 'package:mobile_create/app/data/models/user_register_model.dart';
import 'package:mobile_create/app/domain/entities/adress_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobile_create/app/data/datasource/remote/remote_data_source.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<String> loginUser(String cpf, String password) async {
    final headers = {'Content-Type': 'application/json'};
    final request = http.Request('POST', Uri.parse('https://api-correct-vercel.vercel.app/login-app-user'));
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
      return 'CPF ou senha invalidos! Tente Novamente';
    }
  }

  @override
  Future<String> registerUserIdentity(UserIdentityInfoModel userIdentityInfoModel) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('https://api-correct-vercel.vercel.app/app-user'));

    request.body = userIdentityInfoModel.toJson();
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      return 'created';
    } else {
      return 'not created';
    }
  }

  @override
  Future<String> registerUserAddress(AddressModel addressModel) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('https://api-correct-vercel.vercel.app/app-user/address'));

    request.body = addressModel.toJson();
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      print('aeeeeeeeeeee');
      return 'created';
    } else {
      print("socorrrro ${response.reasonPhrase}");
      return 'not created';
    }
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
  Future<String> registerAdditionalInfo(UserAdditionalInfoModel userAdditionalInfoModel) async {
    final prefs = await SharedPreferences.getInstance();
    final tokenJson = prefs.getString('key');
    final tokenMap = jsonDecode(tokenJson!);
    final token = tokenMap['token'];
    var headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('POST', Uri.parse('https://api-correct-vercel.vercel.app/app-user/info'));

    request.body = userAdditionalInfoModel.toJson();
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 201) {
      print('aeeeeeeeeeee');
      return 'added';
    } else {
      print("socorrrro ${response.reasonPhrase} ${responseBody} ${request.body}");
      return 'not added';
    }
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
