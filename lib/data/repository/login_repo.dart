import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';
import '../dio/dio_client.dart';

class LoginRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  LoginRepo({required this.dioClient, required this.sharedPreferences});

  Future<void> saveUserToken(String token) async {
    dioClient.token = token;
    dioClient.dio!.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };

    try {
      await sharedPreferences.setString(AppConstants.token, token);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveUserFoto(String foto) async {
    try {
      await sharedPreferences.setString(AppConstants.foto, foto);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveUsername(String name) async {
    try {
      await sharedPreferences.setString(AppConstants.username, name);
    } catch (e) {
      rethrow;
    }
  }

  void saveUser(String user) {
    sharedPreferences.setString(AppConstants.user, user);
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.token) ?? "";
  }

  String getFoto() {
    return sharedPreferences.getString(AppConstants.foto) ?? "";
  }

  String getUsername() {
    return sharedPreferences.getString(AppConstants.username) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }

  Future<bool> clearSharedData() async {
    sharedPreferences.clear();
    return true;
  }
}
