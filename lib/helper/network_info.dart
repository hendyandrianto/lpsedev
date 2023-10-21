// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutterlpsetest/utils/custom_themes.dart';

class NetworkInfo {
  final Connectivity? connectivity;
  NetworkInfo(this.connectivity);

  Future<bool> get isConnected async {
    ConnectivityResult result = await connectivity!.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  static void checkConnectivity(BuildContext context) {
    bool firstTime = true;
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (!firstTime) {
        bool isNotConnected = result != ConnectivityResult.wifi &&
            result != ConnectivityResult.mobile;
        if (result == ConnectivityResult.none) {
          isNotConnected = true;
        } else {
          isNotConnected = await _updateConnectivityStatus();
        }
        isNotConnected
            ? const SizedBox()
            : ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isNotConnected ? Colors.red : Colors.green,
          duration: Duration(seconds: isNotConnected ? 6000 : 3),
          content: Text(
              isNotConnected
                  ? "Tidak Ada Koneksi Internet"
                  : "Terhubung dengan Internet",
              textAlign: TextAlign.center,
              style: maisonRegular.copyWith()),
        ));
      }
      firstTime = false;
    });
  }

  static Future<bool> _updateConnectivityStatus() async {
    late bool isConnected;
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('https://google.com/');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } catch (e) {
      isConnected = false;
    }
    return isConnected;
  }
}
