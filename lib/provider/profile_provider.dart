// ignore_for_file: use_build_context_synchronously, prefer_interpolation_to_compose_strings, prefer_final_fields, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterlpsetest/data/model/user_info_model.dart';
import 'package:flutterlpsetest/data/repository/api_response.dart';
import 'package:flutterlpsetest/data/repository/profile_repo.dart';
import 'package:flutterlpsetest/helper/api_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepo? profileRepo;
  final SharedPreferences? prefs;
  ProfileProvider({@required this.profileRepo, @required this.prefs});

  UserInfoModel? _userInfoModel;

  bool _isLoading = false;

  late bool _hasData;

  UserInfoModel? get userInfoModel => _userInfoModel;

  bool get isLoading => _isLoading;
  bool get hasData => _hasData;

  Future<UserInfoModel?> getUserInfo(BuildContext context) async {
    ApiResponse apiResponse = await profileRepo!.getUserInfo();

    if (apiResponse.response?.statusCode == 200) {
      notifyListeners();

      _userInfoModel = UserInfoModel.fromJson(apiResponse.response?.data);
      if (_userInfoModel!.fotoUser != null) {
        prefs?.setString('fotoUser', _userInfoModel!.fotoUser!);
      }
      notifyListeners();
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    return _userInfoModel;
  }
}
