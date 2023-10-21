import 'package:flutterlpsetest/data/dio/api_error_handler.dart';
import 'package:flutterlpsetest/data/dio/dio_client.dart';
import 'package:flutterlpsetest/data/repository/api_response.dart';
import 'package:flutterlpsetest/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  SplashRepo({required this.dioClient, required this.sharedPreferences});

  Future getConfig() async {
    try {
      final response = await dioClient.get(AppConstants.configurl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  void initSharedData() async {
    if (!sharedPreferences.containsKey(AppConstants.intro)) {
      sharedPreferences.setBool(AppConstants.intro, true);
    }
  }

  void disableIntro() {
    sharedPreferences.setBool(AppConstants.intro, false);
  }

  bool? showIntro() {
    return sharedPreferences.getBool(AppConstants.intro);
  }
}
