import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/constant_color.dart';
import '../functions/theme/app_theme.dart';

class MyTextCenter extends StatelessWidget {
  final Function()? onTap;
  final String txtShow;
  final bool? dividerShow;
  const MyTextCenter(
      {Key? key, this.onTap, required this.txtShow, this.dividerShow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    if (!dividerShow!) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Text(
                txtShow,
                style: TextStyle(color: themeProvider.themeMode().textColor!),
              ),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 0.8,
                color: AppColors.thickness,
                //color: Colors.grey[400],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                txtShow,
                style: TextStyle(color: themeProvider.themeMode().textColor!),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 0.8,
                color: AppColors.thickness,
              ),
            ),
          ],
        ),
      );
    }
  }
}
