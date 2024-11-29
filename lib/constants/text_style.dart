import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'color_properties.dart';
 var normal_700_bold_green_25 =  TextStyle(color: PrimaryDarkGreen,fontSize: Dimensions.FONT_SIZE_25,fontWeight:FontWeights.w700);
 var normal_400_regular_black_14 =  TextStyle(color: Red,fontSize: Dimensions.FONT_SIZE_14);
var normal_400_regular_black_15 =  TextStyle(color: black,fontSize: Dimensions.FONT_SIZE_14,fontWeight:FontWeights.w700);
var normal_800_regular=TextStyle(fontWeight: FontWeights.w800);
var normal_400_regular_blue_15 =  TextStyle(color: blue,fontSize: Dimensions.FONT_SIZE_14,fontWeight:FontWeights.w700, decoration: TextDecoration.underline,);
var normal_400_regular_15 =  TextStyle(fontSize: Dimensions.FONT_SIZE_14,fontWeight:FontWeights.w800);
var normal_700=TextStyle(fontWeight: FontWeights.w700);
var login_page_normal_20_regular_800= TextStyle(fontSize: 20.0, color: greenAccent, fontWeight: FontWeights.w800);
// TextStyle(fontSize: Dimensions.FONT_SIZE_14, fontWeight: FontWeight.w800)
var green_save_button_text_color=TextStyle(color:white);
var green_cancel_button_text_color=TextStyle(color:greenAccent,);
var white_save_button_text_color=TextStyle(color:white);
var add_material_button=TextStyle(fontSize: Dimensions.FONT_SIZE_14, fontWeight: FontWeights.w700,color:white);
var custom_text_from_feild_hintstyle=TextStyle(color:grey,fontWeight: FontWeights.w500 );
var set_hint_text_of_grey=TextStyle(color: grey);
var font_size_16=TextStyle(fontSize: Dimensions.FONT_SIZE_16,fontWeight: FontWeights.w500);
var font_size_16_grey_color=TextStyle(fontSize: Dimensions.FONT_SIZE_16,fontWeight: FontWeights.w500,color: grey);
var font_size_18=TextStyle(fontSize: Dimensions.font_size_18,fontWeight: FontWeights.w500);
var font_size_20=TextStyle(fontSize: Dimensions.font_size_20,fontWeight: FontWeights.w500);
var font_size_22=TextStyle(fontSize: Dimensions.font_size_22,fontWeight: FontWeights.w500);
var font_size_24=TextStyle(fontSize: Dimensions.font_size_24,fontWeight: FontWeights.w500);

class FontWeights{
  static FontWeight w700 = FontWeight.bold;
  static FontWeight w400 = FontWeight.w400;
  static FontWeight w500 = FontWeight.w500;
  static FontWeight w800 =FontWeight.w800;
 }
class Dimensions {
  static double font_size_22 = 22.sp;
  static double font_size_24 = 24.sp;

  static double font_size_18=18.sp;
  static double font_size_20 = 20.sp;
  static double font_size_10 = 10.sp;
 static double FONT_SIZE_25 = 25.sp;
 static double FONT_SIZE_16 = 16.0.sp;
 static double FONT_SIZE_14 = 14.0.sp;
 static double FONT_SIZE_11 = 11.0.sp;
 static double FONT_SIZE_12 = 12.0.sp;
 static double FONT_SIZE_10 = 10.0.sp;
 static double fontsize = 10.0.sp;
 static const double CORNER_RADIUS_10 = 10.0;
 static const double Corner_radius_5 = 5.0;
 static const double corner_radius_4 = 4.0;
}