import 'package:flutter/material.dart';
import 'package:login_ui/functions/theme/app_theme.dart';
import 'package:provider/provider.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: themeProvider.themeMode().borderSideColor!),
        borderRadius: BorderRadius.circular(10),
        color: themeProvider.themeMode().fillColor!,
      ),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}