import 'package:flutter/material.dart';

final kTitleStyle = TextStyle(
  color: Colors.black87,
  fontFamily: 'CM Sans Serif',
  fontSize: 26.0,
  height: 1.5,
);

final kSubtitleStyle = TextStyle(
  color: Colors.black87,
  fontSize: 18.0,
  height: 1.2,
);

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

const roundedGradient = LinearGradient(
    colors: [const Color(0xFFFF5F6d), const Color(0xFFFFC371)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);