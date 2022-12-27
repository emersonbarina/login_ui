import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/constant_color.dart';

class ThemeProvider with ChangeNotifier {
  bool isLightTheme;
  bool isOsThemeOn;
  ThemeProvider({required this.isLightTheme, required this.isOsThemeOn});

  getCurrentStatusNavigationBarColor() {
    if (isLightTheme) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.navColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ));
    }
  }

  // use to toggle the theme
  toggleThemeData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (!isOsThemeOn) {
      if (isLightTheme){
        sharedPreferences.setBool(SPref.isLight, false);
        isLightTheme = !isLightTheme;
        notifyListeners();
      }else{
        sharedPreferences.setBool(SPref.isLight, true);
        isLightTheme = !isLightTheme;
        notifyListeners();
      }
      getCurrentStatusNavigationBarColor();
      notifyListeners();
    }
  }

  offThemeData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (isOsThemeOn) {
      sharedPreferences.setBool(SPref.isOsTheme, false);
      isOsThemeOn = false;
    }else{
      sharedPreferences.setBool(SPref.isOsTheme, true);
      isOsThemeOn = true;
    }
  }

  ThemeData themeData() {
    return ThemeData(
      brightness: isLightTheme ? Brightness.light : Brightness.dark,
      scaffoldBackgroundColor:
      isLightTheme ? AppColors.yellow : AppColors.black,
      textTheme: TextTheme(
          headline1: GoogleFonts.stickNoBills(
            fontSize: 70,
            fontWeight: FontWeight.w600,
            color: isLightTheme ? AppColors.black : AppColors.orange,
          ),
          headline2: GoogleFonts.robotoCondensed(
            fontWeight: FontWeight.w500,
            color: isLightTheme ? AppColors.black : AppColors.orange,
          )
      ),
    );
  }

  ThemeMode themeMode() {
    return ThemeMode(
      gradientColors: isLightTheme
          ? [AppColors.yellow, AppColors.yellowDark]
          : [AppColors.black, AppColors.black],
      switchColor: isLightTheme ? AppColors.black : AppColors.orange,
      thumbColor: isLightTheme ? AppColors.orange : AppColors.black,
      switchBgColor: isLightTheme
          ? AppColors.black.withOpacity(.1)
          : AppColors.grey.withOpacity(.3),
      backgroundColor: isLightTheme ? AppColors.white : AppColors.black,
      textColor: isLightTheme ? AppColors.text : AppColors.textDark,
      textHighLightColor: isLightTheme ? AppColors.textHighlight : AppColors.textHighlightDark,
      textHintColor: isLightTheme ? AppColors.hint : AppColors.hintDark,
      fillColor: isLightTheme ? AppColors.fill : AppColors.fillDark,
      borderFocusColor: isLightTheme ? AppColors.borderFocus : AppColors.borderFocusDark,
      borderSideColor: isLightTheme ? AppColors.borderSide : AppColors.borderSideDark,
      myButtonColor: isLightTheme ? AppColors.button : AppColors.buttonDark,
      myButtonTextColor: isLightTheme ? AppColors.textButton : AppColors.textButtonDark,
    );
  }
}

class ThemeMode {
  List<Color>? gradientColors;
  Color? switchColor;
  Color? thumbColor;
  Color? switchBgColor;
  Color? backgroundColor;
  Color? textColor;
  Color? textHintColor;
  Color? textHighLightColor;
  Color? borderSideColor;
  Color? borderFocusColor;
  Color? fillColor;
  Color? thicknessColor;
  Color? myButtonColor;
  Color? myButtonTextColor;

  ThemeMode({
      this.gradientColors,
      this.switchColor,
      this.thumbColor,
      this.switchBgColor,
      this.backgroundColor,
      this.textColor,
      this.textHintColor,
      this.textHighLightColor,
      this.borderSideColor,
      this.borderFocusColor,
      this.fillColor,
      this.thicknessColor,
      this.myButtonColor,
      this.myButtonTextColor});
}
