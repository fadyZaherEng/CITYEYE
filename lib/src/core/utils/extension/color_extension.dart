import 'package:flutter/material.dart';

extension ColorExtension on String {
  Color get toColor {
    if(isNotEmpty){
      return Color(int.parse(replaceAll("#", "ff"), radix: 16) | 0xFF000000);
    }else{
      return Colors.transparent;
    }
  }
}
