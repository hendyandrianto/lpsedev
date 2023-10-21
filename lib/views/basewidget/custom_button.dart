import 'package:flutter/material.dart';

import '../../utils/color_resources.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonText;
  const CustomButton(
      {super.key, @required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ColorResources.getChatIcon(context),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 1)), // changes position of shadow
            ],
            gradient: LinearGradient(colors: [
              ColorResources.getPrimary(context),
              ColorResources.getPrimary(context),
              ColorResources.getPrimary(context),
            ]),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
