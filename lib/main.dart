import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog_codyad/my_Colors.dart';
import 'package:techblog_codyad/View/splash_Screen.dart';
import 'package:techblog_codyad/View/register_intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''),
      ],
      theme: ThemeData(
        fontFamily: 'Vazir',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17,
            color: solidColors.posterTitle,
          ),
          headline2: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: solidColors.posterTitle,
          ),
          headline3: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: solidColors.colorTitles,
          ),
          headline4: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: solidColors.textTitles,
          ),
          subtitle1: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 13,
            color: solidColors.subTitle,
          ),
        ),
      ),
      // home: splashScreen(),
      home: RegisterIntro(),
    );
  }
}
