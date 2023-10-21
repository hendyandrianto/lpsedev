import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterlpsetest/views/dashboard/dashboard_screen.dart';
import 'package:http/http.dart' as http;
import 'package:legacy_progress_dialog/legacy_progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/dio/dio_client.dart';
import '../data/repository/login_repo.dart';
import '../utils/app_constants.dart';
import '../utils/color_resources.dart';
import '../views/basewidget/animated_custom_dialog.dart';
import '../views/basewidget/my_dialog.dart';

class LoginProvider extends ChangeNotifier {
  final LoginRepo? authRepo;
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  LoginProvider(
      {@required this.dioClient,
      @required this.authRepo,
      @required this.sharedPreferences});

  late bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future doLogin(BuildContext context, String username) async {
    _isLoading = true;
    ProgressDialog progressDialog = ProgressDialog(
      context: context,
      loadingText: "Mohon menunggu...",
      assetImageName: 'assets/images/logo.png',
      backgroundColor: ColorResources.getHomeBg(context),
      textColor: Colors.black,
    );
    try {
      _isLoading = false;
      progressDialog.show();
      cekUser(username, context, progressDialog);
    } catch (e) {
      _isLoading = false;
      progressDialog.dismiss();
      showAnimatedDialog(
          context,
          const MyDialog(
            icon: Icons.clear,
            title: "Informasi",
            description: "Err",
            isFailed: true,
          ),
          dismissible: false,
          isFlip: true);
    }
    notifyListeners();
  }

  Future cekUser(String username, context, progressDialog) async {
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 500), () {
      http.post(Uri.parse(AppConstants.loginurl), body: {
        "username": username,
        "key": AppConstants.key
      }).then((res) async {
        Map map = jsonDecode(res.body);
        String message = map["message"];
        if (message == "success") {
          String namauser = map["namauser"];
          String fotouser = map["image"];
          authRepo!.saveUserToken(username);
          authRepo!.saveUserFoto(fotouser);
          authRepo!.saveUsername(namauser);
          setUser(username);
          authRepo!.isLoggedIn();
          await Future.delayed(const Duration(milliseconds: 500))
              .then((v) async {
            progressDialog.dismiss();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const DashBoardScreen()),
                (Route<dynamic> route) => false);
          });
        } else {
          progressDialog.dismiss();
          showAnimatedDialog(
              context,
              MyDialog(
                icon: Icons.clear,
                title: "Informasi",
                description: message,
                isFailed: true,
              ),
              dismissible: false,
              isFlip: true);
        }
      }).catchError((err) {
        if (kDebugMode) {
          print(err);
        }
      });
    });
    notifyListeners();
  }

  void setUser(String username) {
    authRepo!.saveUser(username);
    notifyListeners();
  }

  bool isLoggedIn() {
    return authRepo!.isLoggedIn();
  }

  String getUserToken() {
    return authRepo!.getUserToken();
  }

  String getUsername() {
    return authRepo!.getUsername();
  }

  String getFoto() {
    return authRepo!.getFoto();
  }

  Future<bool> clearSharedData() async {
    return await authRepo!.clearSharedData();
  }
}
