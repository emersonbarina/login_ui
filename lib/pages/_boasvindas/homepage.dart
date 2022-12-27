import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(),
      ),*/
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.appName,
          style: Theme.of(context).textTheme.headline1,

        ),
      ),

    );
  }
}
