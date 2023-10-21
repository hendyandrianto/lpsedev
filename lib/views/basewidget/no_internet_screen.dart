// ignore_for_file: use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutterlpsetest/utils/color_resources.dart';
import 'package:flutterlpsetest/utils/custom_themes.dart';
import 'package:flutterlpsetest/utils/dimensions.dart';

import '../../utils/images.dart';

class NoInternetOrDataScreen extends StatelessWidget {
  final bool? isNoInternet;
  final Widget? child;
  const NoInternetOrDataScreen(
      {super.key, @required this.isNoInternet, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(isNoInternet! ? Images.nointernet : Images.nodata,
                width: 150, height: 150),
            Text(isNoInternet! ? "Opps" : "Mohon Maaf",
                style: maisonBold.copyWith(
                  fontSize: 30,
                  color: isNoInternet!
                      ? Theme.of(context).textTheme.bodyLarge?.color
                      : ColorResources.getColombiaBlue(context),
                )),
            const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Text(
              isNoInternet!
                  ? 'Tidak ada jaringan internet'
                  : 'Data tidak tersedia',
              textAlign: TextAlign.center,
              style: maisonRegular,
            ),
            const SizedBox(height: 40),
            isNoInternet!
                ? Container(
                    height: 45,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorResources.getYellow(context)),
                    child: TextButton(
                      onPressed: () async {
                        if (await Connectivity().checkConnectivity() !=
                            ConnectivityResult.none) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => child!));
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text("COBA LAGI",
                            style: maisonSemiBold.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: Dimensions.FONT_SIZE_LARGE)),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
