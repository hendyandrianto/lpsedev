import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/color_resources.dart';

buildAppBar(String title, BuildContext context) {
  return AppBar(
    backgroundColor: ColorResources.CERISE,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        color: ColorResources.WHITE,
      ),
    ),
    automaticallyImplyLeading: false,
    actions: [
      GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SizedBox(
            height: 24,
            width: 24,
            child: Image.asset(
              "assets/icons/bell.png",
              color: ColorResources.WHITE,
            ),
          ),
        ),
      ),
    ],
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}
