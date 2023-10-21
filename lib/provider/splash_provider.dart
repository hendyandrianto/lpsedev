// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutterlpsetest/data/model/config_model.dart';
import 'package:flutterlpsetest/data/repository/api_response.dart';
import 'package:flutterlpsetest/data/repository/splash_repo.dart';
import 'package:flutterlpsetest/helper/api_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends ChangeNotifier {
  SplashRepo? splashRepo;
  SharedPreferences? sharedPreferences;
  SplashProvider({@required this.splashRepo, @required this.sharedPreferences});

  ConfigModel? _configModel;
  BaseUrls? _baseUrls;
  int? _currencyIndex;
  bool? _hasConnection = true;
  bool? _fromSetting = false;
  bool? _firstTimeConnectionCheck = true;

  ConfigModel? get configModel => _configModel;
  BaseUrls? get baseUrls => _baseUrls;

  int? get currencyIndex => _currencyIndex;

  bool? get hasConnection => _hasConnection;
  bool? get fromSetting => _fromSetting;
  bool? get firstTimeConnectionCheck => _firstTimeConnectionCheck;

  Future<bool> initConfig(BuildContext context) async {
    _hasConnection = true;
    ApiResponse apiResponse = await splashRepo!.getConfig();
    bool isSuccess;
    if (apiResponse.response?.statusCode == 200) {
      _configModel = ConfigModel.fromJson(apiResponse.response?.data);
      _baseUrls = ConfigModel.fromJson(apiResponse.response?.data).baseUrls!;
      isSuccess = true;
    } else {
      isSuccess = false;
      ApiChecker.checkApi(context, apiResponse);
      _hasConnection = false;
    }
    notifyListeners();
    return isSuccess;
  }

  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }

  void initSharedPrefData() {
    splashRepo!.initSharedData();
  }

  void setFromSetting(bool isSetting) {
    _fromSetting = isSetting;
  }

  bool? showIntro() {
    return splashRepo!.showIntro();
  }

  void disableIntro() {
    splashRepo!.disableIntro();
  }
}
