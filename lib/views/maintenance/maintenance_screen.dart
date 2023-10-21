import 'package:flutter/material.dart';
import 'package:flutterlpsetest/utils/color_resources.dart';
import 'package:flutterlpsetest/utils/custom_themes.dart';
import 'package:flutterlpsetest/utils/dimensions.dart';
import 'package:flutterlpsetest/utils/images.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(Images.maintenance, width: 250, height: 250),
            Text("Mode Pemeliharaan Server",
                style: maisonBold.copyWith(
                  fontSize: 22,
                  color: ColorResources.getColombiaBlue(context),
                )),
            const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            const Text(
              "Kami sedang melakukan beberapa pemeliharaan server. Kami akan kembali secepat mungkin. Silakan periksa secara berkala. Terimakasih",
              textAlign: TextAlign.center,
              style: maisonRegular,
            ),
          ]),
        ),
      ),
    );
  }
}
