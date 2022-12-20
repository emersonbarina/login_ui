import 'package:flutter/material.dart';
import 'package:login_ui/constant/constant_color.dart';
import 'package:login_ui/functions/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // Ativar o tema claro quando true, e escuro quando false
  bool isLightTheme = sharedPreferences.getBool(SPref.isLight) ?? true;
  // Ativar o tema de acordo com o tema selecionado no sistema operacional
  bool isOsThemeOn = sharedPreferences.getBool(SPref.isOsTheme) ?? false;
  if (isOsThemeOn) {
    var brightness = WidgetsBinding.instance.window.platformBrightness;
    brightness == Brightness.dark ? isLightTheme = false : isLightTheme = true;
  }
  runApp(AppStarter(
      isLightTheme: isLightTheme,
      isOsThemeOn: isOsThemeOn,
  ));
}

class AppStarter extends StatelessWidget {
  const AppStarter(
      {Key? key, required this.isLightTheme, required this.isOsThemeOn})
      : super(key: key);
  final bool isLightTheme;
  final bool isOsThemeOn;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isLightTheme: isLightTheme, isOsThemeOn: isOsThemeOn),
      ),
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
