import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog_codyad/gen/assets.gen.dart';
import 'package:techblog_codyad/View/main_screen.dart';
import 'package:techblog_codyad/my_Colors.dart';

class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then(
      (value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => mainScreen(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(Assets.images.logo.path),
              height: 64,
            ),
            SizedBox(
              height: 16.0,
            ),
            SpinKitThreeBounce(
              color: solidColors.primaryColor,
              size: 32.0,
            )
          ],
        ),
      ),
    );
  }
}
