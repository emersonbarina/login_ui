import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../functions/theme/app_theme.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String txtButton;

  const MyButton({super.key, this.onTap, required this.txtButton});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: themeProvider.themeMode().myButtonColor!,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            txtButton,
            style: TextStyle(
              color: themeProvider.themeMode().myButtonTextColor!,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
