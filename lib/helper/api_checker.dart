import 'package:flutter/material.dart';
import 'package:flutterlpsetest/data/repository/api_response.dart';

class ApiChecker {
  static void checkApi(BuildContext context, ApiResponse apiResponse) {
    if (apiResponse.error is! String &&
        apiResponse.error.errors[0].message == 'Unauthorized.') {
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text(errorMessage, style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.red));
    }
  }
}
