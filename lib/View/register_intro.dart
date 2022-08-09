import 'package:flutter/material.dart';
import 'package:techblog_codyad/gen/assets.gen.dart';
import 'package:techblog_codyad/my_Colors.dart';
import 'package:techblog_codyad/my_strings.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var texTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.tcbot.path,
                height: 150,
              ),
              const SizedBox(height: 32),
              RichText(
                text: TextSpan(
                  text: MyStrings.welcome,
                  style: texTheme.headline4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 64),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return texTheme.headline1;
                      }
                      return texTheme.subtitle1;
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
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(64, 16, 64, 16),
                  child: Text("بزن بریم"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
