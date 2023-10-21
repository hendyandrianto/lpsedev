import 'package:flutter/material.dart';
import 'package:flutterlpsetest/provider/login_provider.dart';
import 'package:flutterlpsetest/utils/color_resources.dart';
import 'package:flutterlpsetest/utils/custom_themes.dart';
import 'package:flutterlpsetest/utils/dimensions.dart';
import 'package:flutterlpsetest/views/dashboard/dashboard_screen.dart';
import 'package:flutterlpsetest/views/login/login_screen.dart';
import 'package:provider/provider.dart';

class SignOutConfirmationDialog extends StatelessWidget {
  const SignOutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: 50),
          child: Text("Yakin akan keluar ?",
              style: maisonBold, textAlign: TextAlign.center),
        ),
        const Divider(height: 0, color: ColorResources.HINT_TEXT_COLOR),
        Row(children: [
          Expanded(
              child: InkWell(
            onTap: () {
              Provider.of<LoginProvider>(context, listen: false)
                  .clearSharedData()
                  .then((condition) {
                Navigator.pop(context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(10))),
              child: Text("Yes",
                  style: maisonBold.copyWith(color: const Color(0xff216BFF))),
            ),
          )),
          Expanded(
              child: InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const DashBoardScreen()),
                  (route) => false);
            },
            child: Container(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: ColorResources.RED,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(10))),
              child: Text("No",
                  style: maisonBold.copyWith(color: ColorResources.WHITE)),
            ),
          )),
        ]),
      ]),
    );
  }
}
