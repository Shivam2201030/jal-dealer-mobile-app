
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'color_properties.dart';

 var normal_700_bold_green_25 =  TextStyle(color: PrimaryDarkGreen,fontSize: Dimensions.FONT_SIZE_25,fontWeight: FontWeight.bold);
 var normal_400_regular_black_14 =  TextStyle(color: Red,fontSize: Dimensions.FONT_SIZE_14);

 class FontWeights{
  static FontWeight w700 = FontWeight.bold;
  static FontWeight w400 = FontWeight.w400;
  static FontWeight w500 = FontWeight.w500;
 }

class Dimensions {

 //static double FONT_SIZE_SMALL = 12.5.spp;
 static double FONT_SIZE_25 = 25.sp;
 static double FONT_SIZE_16 = 16.0.sp;
 static double FONT_SIZE_14 = 14.0.sp;
 static double FONT_SIZE_11 = 11.0.sp;
 static double FONT_SIZE_12 = 12.0.sp;
 static double FONT_SIZE_10 = 10.0.sp;

 /// use this for give radius to circle
 static const double CORNER_RADIUS = 10.0;
}