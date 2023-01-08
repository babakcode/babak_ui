import 'package:babak_ui/src/extensions/color_extension.dart';
import 'package:flutter/material.dart';

class BabakUIConstant {
  BabakUIConstant._();

  // static String get baseUrl => "https://ui.babakcode.com/";
  static String get baseUrl => 'http://192.168.195.220:50005/';

  static String get globalEncryptKey => 'jwudq2ekwowamknwaod31jsbf21elwda';

  static String get globalEncryptIV => 'jwudq2ekwowamknwaod31jsbf21elwda';

  static Color detectColor(String color) {
    if (color.startsWith('#')) {
      return ColorExtension.fromHex(color);
    } else if (color.toLowerCase().startsWith("0xff")) {
      return ColorExtension.fromHex(color.replaceAll('0x', '#'));
    }
    return ColorExtension.fromName(color);
  }

  static const Map<String, Color> colorStringToColor = {
    'amber': Colors.amber,
    'amberAccent': Colors.amberAccent,
    'black': Colors.black,
    'black12': Colors.black12,
    'black26': Colors.black26,
    'black38': Colors.black38,
    'black45': Colors.black45,
    'black54': Colors.black54,
    'black87': Colors.black87,
    'blue': Colors.blue,
    'blueAccent': Colors.blueAccent,
    'blueGrey': Colors.blueGrey,
    'brown': Colors.brown,
    'cyan': Colors.cyan,
    'cyanAccent': Colors.cyanAccent,
    'deepOrange': Colors.deepOrange,
    'deepOrangeAccent': Colors.deepOrangeAccent,
    'deepPurple': Colors.deepPurple,
    'deepPurpleAccent': Colors.deepPurpleAccent,
    'green': Colors.green,
    'greenAccent': Colors.greenAccent,
    'grey': Colors.grey,
    'indigo': Colors.indigo,
    'indigoAccent': Colors.indigoAccent,
    'lightBlue': Colors.lightBlue,
    'lightBlueAccent': Colors.lightBlueAccent,
    'lightGreen': Colors.lightGreen,
    'lightGreenAccent': Colors.lightGreenAccent,
    'lime': Colors.lime,
    'limeAccent': Colors.limeAccent,
    'orange': Colors.orange,
    'orangeAccent': Colors.orangeAccent,
    'pink': Colors.pink,
    'pinkAccent': Colors.pinkAccent,
    'purple': Colors.purple,
    'purpleAccent': Colors.purpleAccent,
    'red': Colors.red,
    'redAccent': Colors.redAccent,
    'teal': Colors.teal,
    'tealAccent': Colors.tealAccent,
    'transparent': Colors.transparent,
    'white': Colors.white,
    'white10': Colors.white10,
    'white12': Colors.white12,
    'white24': Colors.white24,
    'white30': Colors.white30,
    'white38': Colors.white38,
    'white54': Colors.white54,
    'white60': Colors.white60,
    'white70': Colors.white70,
    'yellow': Colors.yellow,
    'yellowAccent': Colors.yellowAccent,
  };
}
