import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterlpsetest/data/dio/api_error_handler.dart';
import 'package:flutterlpsetest/data/dio/dio_client.dart';
import 'package:flutterlpsetest/data/repository/api_response.dart';
import 'package:flutterlpsetest/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  ProfileRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> getUserInfo() async {
    try {
      Response response = await dioClient!.post(
        AppConstants.profileurl,
        data: {"_method": "post"},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
