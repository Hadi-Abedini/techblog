import 'package:flutter/material.dart';
import 'package:techblog_codyad/View/my_cats.dart';
import 'package:techblog_codyad/gen/assets.gen.dart';
import 'package:techblog_codyad/my_colors.dart';
import 'package:techblog_codyad/my_strings.dart';
import 'package:email_validator/email_validator.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

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
                  style: textTheme.headline4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 64),
              ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(64, 16, 64, 16),
                  child: Text("بزن بریم"),
                ),
                onPressed: () {
                  _showEmailBottumSheet(context, size, textTheme);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottumSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    var status = false;
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2.5,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: SolidColors.scaffoldBg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.isertYourEmial,
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 64),
                    child: TextField(
                      onChanged: (value) {
                        status = EmailValidator.validate(value);
                      },
                      textAlign: TextAlign.center,
                      style: textTheme.headline4,
                      decoration: InputDecoration(
                        hintText: "techblog@gmail.com",
                        hintStyle: textTheme.headline5,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (status == true) {
                        Navigator.pop(context);
                        _showActiveCodeBottumSheet(context, size, textTheme);
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(64, 16, 64, 16),
                      child: Text("ادامه"),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _showActiveCodeBottumSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2.5,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: SolidColors.scaffoldBg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.isertActiveCodeEmial,
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 64),
                    child: TextField(
                      onChanged: (value) {
                        if (EmailValidator.validate(value) == true) {}
                      },
                      textAlign: TextAlign.center,
                      style: textTheme.headline4,
                      decoration: InputDecoration(
                        hintText: "******",
                        hintStyle: textTheme.headline5,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MyCats(textTheme: textTheme),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(64, 16, 64, 16),
                      child: Text("ادامه"),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
