import 'dart:convert';
import 'dart:developer';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:mobile_create/app/data/datasource/local/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final LocalAuthentication _auth = LocalAuthentication();

  @override
  Future<bool> canAuthFaceIdBio() async => await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  @override
  Future<bool> authFaceIdBio() async {
    try {
      if (!await canAuthFaceIdBio()) {
        return false;
      }
      return await _auth.authenticate(
        localizedReason: 'Please authenticate to sign in',
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ],
        options: const AuthenticationOptions(useErrorDialogs: true, stickyAuth: true),
      );
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return false;
    }
  }

  @override
  Future<bool> isFirstTime() async {
    const String first = 'first';
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(first);

    if (jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);
      print(" Deus me ajude ${mapUser}");
      return mapUser['first'];
    }

    return false;
  }

  @override
  Future<bool> endFirstTime(String token) async {
    try {
      const String first = 'first';
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        first,
        jsonEncode(
          {
            "token": token,
            "first": false,
          },
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
