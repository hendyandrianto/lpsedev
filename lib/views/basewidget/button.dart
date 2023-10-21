import 'package:flutter/material.dart';
import '../../utils/color_resources.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPress;

  const Button({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: ColorResources.getPrimary(context),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
