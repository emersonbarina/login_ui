import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_ui/functions/theme/app_theme.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key, this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: themeProvider.themeMode().borderSideColor!),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: themeProvider.themeMode().borderFocusColor!),
          ),
          fillColor: themeProvider.themeMode().fillColor!,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: themeProvider.themeMode().textHintColor!),
        ),
      ),
    );
  }
}

