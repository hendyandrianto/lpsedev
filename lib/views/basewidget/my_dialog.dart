import 'package:flutter/material.dart';

import '../../utils/color_resources.dart';
import '../../utils/dimensions.dart';
import 'custom_button.dart';

class MyDialog extends StatelessWidget {
  final bool? isFailed;
  final double? rotateAngle;
  final IconData? icon;
  final String? title;
  final String? description;
  const MyDialog(
      {super.key,
      this.isFailed = false,
      this.rotateAngle = 0,
      @required this.icon,
      @required this.title,
      @required this.description});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        child: Stack(clipBehavior: Clip.none, children: [
          Positioned(
            left: 0,
            right: 0,
            top: -55,
            child: Container(
              height: 80,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: isFailed!
                      ? ColorResources.getRed(context)
                      : ColorResources.getPrimary(context),
                  shape: BoxShape.circle),
              child: Transform.rotate(
                  angle: rotateAngle!,
                  child: Icon(icon, size: 40, color: Colors.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                ),
              ),
              const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              Text(
                description!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                ),
              ),
              const SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_LARGE),
                child: CustomButton(
                    buttonText: "OK",
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
