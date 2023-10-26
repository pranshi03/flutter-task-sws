import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
String? ACCESS_TOKEN = "";
String? USER_ID = "";

class CLR {
  static const goldShade = Color(0xffCEB23C);
  static const hintTextColor = Color(0xff747474);
  static const backgroundColor = Color(0xffE5E5E5);
  static const disabledColor = Color(0xffdac46b);
  static const lightGreenShade1 = Color(0xffC9ECBA);
  static const black = Color(0xff0f0f0f);
  static const white = Color(0xffFFFFFF);

  static const lightGreenShade2 = Color(0xffABDA97);
  static const lightGreenShade3 = Color(0xff59AC00);

}

class ImagePaths {
  static const String appLogo = 'assets/images/google.png';
  static const String googleLogo = 'images/google.png';
  static const String appleLogo = 'images/apple_logo.png';
  static const String signOutLogo = 'images/logout.png';

}

class Fonts {
  static String avenirNextLTProRegular = "AvenirNextLTProRegular";
  static String AvenirNextLTProBold = "AvenirNextLTProBold";
  static String AvenirNextLTProIt = "AvenirNextLTProIt";
  static String VAGRoundedRegular = "VAG_Rounded_Regular.ttf";
  static String AvenirNextLTProMedium = "AvenirNextLTProMedium";
  static String AvenirNextLTProDemi = "AvenirNextLTProDemi";
}

class RoutesName {
  // ignore: non_constant_identifier_names
  static const String LOGIN_PAGE = '/login';
  static const String SPLASH_PAGE = '/';

}




class TEXTSTYLES {
  static TextStyle poppinsMediumColor = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w400, color: CLR.goldShade);
  static TextStyle poppinsSmallMediumColor = GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w400, color: CLR.goldShade);
  static TextStyle poppinsSemiBold =
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500);
}
