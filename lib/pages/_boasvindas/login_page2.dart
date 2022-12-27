import 'package:flutter/material.dart';
import 'package:login_ui/components/my_text_center.dart';
import 'package:login_ui/functions/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:login_ui/components/my_textfield.dart';
import 'package:login_ui/components/my_button.dart';
import 'package:login_ui/components/square_tile.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({Key? key}) : super(key: key);

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    super.didChangeDependencies();
  }

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          center: const Alignment(-0.9, -0.3),
          radius: 1,
          colors: themeProvider.themeMode().gradientColors!,
        )),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                const SizedBox(height: 25),

                Image.asset(
                  'assets/app/icon-mono-transparent.png',
                  height: 200,
                  width: 200,
                ),

                //const SizedBox(height: 50),

                /*const Icon(
                Icons.lock,
                size: 100,
              ),*/

                const SizedBox(height: 25),

                MyTextField(
                  controller: _usernameController,
                  hintText: AppLocalizations.of(context)!.emailHint,
                  obscureText: false,
                  //tProvider: themeProvider,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: _passwordController,
                  hintText: AppLocalizations.of(context)!.passwordHint,
                  obscureText: true,
                  //tProvider: themeProvider,
                ),

                const SizedBox(height: 20),

                MyTextCenter(txtShow: AppLocalizations.of(context)!.forgot),

                const SizedBox(height: 20),

                // sign in button
                MyButton(
                  onTap: signUserIn,
                  txtButton: AppLocalizations.of(context)!.signIn,
                ),

                const SizedBox(height: 25),

                // or continue with
                MyTextCenter(txtShow: AppLocalizations.of(context)!.signOr, dividerShow: true,),


                const SizedBox(height: 20),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'assets/images/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'assets/images/apple.png')
                  ],
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.notMember,
                      style: TextStyle(color: themeProvider.themeMode().textColor!),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      AppLocalizations.of(context)!.registerNow,
                      style: TextStyle(
                        color: themeProvider.themeMode().textHighLightColor!,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
