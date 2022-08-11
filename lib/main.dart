import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog_codyad/View/splash_screen.dart';
import 'package:techblog_codyad/my_colors.dart';

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
            color: SolidColors.posterTitle,
          ),
          headline2: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: SolidColors.posterTitle,
          ),
          headline3: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: SolidColors.colorTitles,
          ),
          headline4: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: SolidColors.textTitles,
          ),
          headline5: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: SolidColors.hintText,
          ),
          subtitle1: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 13,
            color: SolidColors.subTitle,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(width: 15),
          ),
          filled: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return Theme.of(context).textTheme.headline3;
                }
                return Theme.of(context).textTheme.subtitle1;
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return SolidColors.colorTitles;
                }
                return SolidColors.primaryColor;
              },
            ),
          ),
        ),
      ),
      // home: splashScreen(),
      home: const SplashScreen(),
    );
  }
}
