import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dimensions.dart';

const maisonRegular = TextStyle(
  fontFamily: 'Primary',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
);

const maisonSemiBold = TextStyle(
  fontFamily: 'Primary',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w600,
);

const maisonBold = TextStyle(
  fontFamily: 'Primary',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w700,
);
const maisonItalic = TextStyle(
  fontFamily: 'Primary',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontStyle: FontStyle.italic,
);

SystemUiOverlayStyle? systemOverlayStyleIos =
    Platform.isIOS ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light;
