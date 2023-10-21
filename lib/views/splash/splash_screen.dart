import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutterlpsetest/provider/login_provider.dart';
import 'package:flutterlpsetest/provider/splash_provider.dart';
import 'package:flutterlpsetest/utils/color_resources.dart';
import 'package:flutterlpsetest/utils/custom_themes.dart';
import 'package:flutterlpsetest/utils/images.dart';
import 'package:flutterlpsetest/views/basewidget/no_internet_screen.dart';
import 'package:flutterlpsetest/views/dashboard/dashboard_screen.dart';
import 'package:flutterlpsetest/views/login/login_screen.dart';
import 'package:flutterlpsetest/views/splash/widget/splash_painter.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    bool? firstTime = true;
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (!firstTime!) {
        bool? isNotConnected = result != ConnectivityResult.wifi &&
            result != ConnectivityResult.mobile;
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
          ),
        ));
        if (!isNotConnected) {
          Future.delayed(const Duration(milliseconds: 50), () {
            _route();
          });
        }
      }
      firstTime = false;
    });

    Future.delayed(const Duration(milliseconds: 50), () {
      _route();
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void _route() {
    Provider.of<SplashProvider>(context, listen: false)
        .initConfig(context)
        .then((bool isSuccess) {
      if (isSuccess) {
        Provider.of<SplashProvider>(context, listen: false)
            .initSharedPrefData();
        Timer(const Duration(seconds: 1), () {
          if (Provider.of<SplashProvider>(context, listen: false)
              .configModel!
              .maintenanceMode!) {
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //     builder: (BuildContext context) => MaintenanceScreen()));
          } else {
            if (Provider.of<LoginProvider>(context, listen: false)
                .isLoggedIn()) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const DashBoardScreen()));
            } else {
              // if (Provider.of<SplashProvider>(context, listen: false)
              //     .showIntro()!) {
              //   Navigator.of(context).pushReplacement(MaterialPageRoute(
              //       builder: (BuildContext context) => OnBoardingScreen(
              //             indicatorColor: ColorResources.GREY,
              //             selectedIndicatorColor: const Color(0xff216BFF),
              //           )));
              // } else {
              //   Navigator.of(context).pushReplacement(MaterialPageRoute(
              //       builder: (BuildContext context) => const LoginScreen()));
              // }
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const LoginScreen()));
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _globalKey,
        body: Provider.of<SplashProvider>(context).hasConnection!
            ? Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: ColorResources.getPrimary(context),
                    child: CustomPaint(
                      painter: SplashPainter(),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(Images.logoimage,
                            height: 250.0, fit: BoxFit.scaleDown, width: 250.0),
                        Text(
                          "CekLPSE",
                          style: maisonBold.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const NoInternetOrDataScreen(
                isNoInternet: true, child: SplashScreen()),
      ),
    );
  }
}
