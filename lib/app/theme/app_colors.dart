import 'package:flutter/material.dart';

//first two characters (FF) are alpha values (transparency)

const Color coPrimary = Color(0xFFFF3364);
const Color primaryColor=Color(0xFFEE2A24);
MaterialColor brand = MaterialColor(0xFFEE2A24, coColorMap);
MaterialColor coBrand = MaterialColor(0xFFFF3364, colorMap);
const Color secondaryColor = Color(0xFF9A63FF);
const Color textColor = Color(0xFF2A2B50);
const Color backColor = Color(0xFFF25043);
const Color lightBlue = Color(0xFFD4E3FF);
const Color errorColor = Colors.red;
const Color neutral = Colors.black;

Map<int, Color> colorMap = const {
  50: Color.fromRGBO(255, 51, 100, .1),
  100: Color.fromRGBO(250, 51, 100, .2),
  200: Color.fromRGBO(250, 51, 100, .3),
  300: Color.fromRGBO(250, 51, 100, .4),
  400: Color.fromRGBO(250, 51, 100, .5),
  500: Color.fromRGBO(250, 51, 100, .6),
  600: Color.fromRGBO(250, 51, 100, .7),
  700: Color.fromRGBO(250, 51, 100, .8),
  800: Color.fromRGBO(250, 51, 100, .9),
  900: Color.fromRGBO(250, 51, 100, 1),
};

Map<int, Color> coColorMap = const {
  50: Color.fromRGBO(238, 42, 36, .1),
  100: Color.fromRGBO(238, 42, 36, .2),
  200: Color.fromRGBO(238, 42, 36, .3),
  300: Color.fromRGBO(238, 42, 36, .4),
  400: Color.fromRGBO(238, 42, 36, .5),
  500: Color.fromRGBO(238, 42, 36, .6),
  600: Color.fromRGBO(238, 42, 36, .7),
  700: Color.fromRGBO(238, 42, 36, .8),
  800: Color.fromRGBO(238, 42, 36, .9),
  900: Color.fromRGBO(238, 42, 36, 1),
};

/* CSV *//*

2c3c8c,05a0fb,04ddfc,c8d6e9,6972af,5be4fc,20e4ff,20e4ff,20e4ff

*/
/* Array *//*

["2c3c8c","05a0fb","04ddfc","c8d6e9","6972af","5be4fc","20e4ff","20e4ff","20e4ff"]*/

/* CSS HEX *//*

--bay-of many: #2c3c8c;
--azure-radiance: #05a0fb;
--cyan-/ aqua: #04ddfc;
--periwinkle-gray: #c8d6e9;
--scampi: #6972af;
--malibu: #5be4fc;
--cyan-/ aqua: #20e4ff;
--cyan-/ aqua: #20e4ff;
--cyan-/ aqua: #20e4ff;


*/
/* SCSS HEX *//*

$bay-of many: #2c3c8c;
$azure-radiance: #05a0fb;
$cyan-/ aqua: #04ddfc;
$periwinkle-gray: #c8d6e9;
$scampi: #6972af;
$malibu: #5be4fc;
$cyan-/ aqua: #20e4ff;
$cyan-/ aqua: #20e4ff;
$cyan-/ aqua: #20e4ff;


*/
/* SCSS RGB *//*

--bay-of many: rgba(44,60,140,1);
--azure-radiance: rgba(5,160,251,1);
--cyan-/ aqua: rgba(4,221,252,1);
--periwinkle-gray: rgba(200,214,233,1);
--scampi: rgba(105,114,175,1);
--malibu: rgba(91,228,252,1);
--cyan-/ aqua: rgba(32,228,256,1);
--cyan-/ aqua: rgba(32,228,256,1);
--cyan-/ aqua: rgba(32,228,256,1);
*/
