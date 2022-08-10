import 'package:flutter/material.dart';
import 'package:techblog_codyad/View/home_screen.dart';
import 'package:techblog_codyad/View/profile_screen.dart';
import 'package:techblog_codyad/View/register_intro.dart';
import 'package:techblog_codyad/gen/assets.gen.dart';
import 'package:techblog_codyad/my_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var texTheme = Theme.of(context).textTheme;
    var bodymargen = size.width / 12.53;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: SolidColors.scaffoldBg,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.fromLTRB(bodymargen / 2, 0, bodymargen / 2, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.dehaze,
                  size: size.height / 25,
                  color: Colors.black,
                ),
                Image(
                  height: size.height / 13.64,
                  image: AssetImage(Assets.images.logo.path),
                ),
                Icon(
                  Icons.search,
                  size: size.height / 25,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: selectedPageIndex,
                children: [
                  HomeScreen(
                      bodymargen: bodymargen, size: size, texTheme: texTheme),
                  const RegisterIntro(),
                  ProfileScreen(
                      bodymargen: bodymargen, size: size, texTheme: texTheme),
                ],
              ),
            ),
            ButtonNavigation(
              size: size,
              bodymargen: bodymargen,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonNavigation extends StatelessWidget {
  const ButtonNavigation({
    Key? key,
    required this.size,
    required this.bodymargen,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodymargen;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 5.5,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradiantColors.bottomnNavback,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(bodymargen, 44, bodymargen, 44),
          child: Container(
            height: size.height / 15,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              gradient: LinearGradient(
                colors: GradiantColors.bottomnNav,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: (() => changeScreen(0)),
                  icon: ImageIcon(
                    AssetImage(Assets.icons.home.path),
                    color: SolidColors.posterTitle,
                  ),
                ),
                IconButton(
                  onPressed: (() => changeScreen(1)),
                  icon: ImageIcon(
                    AssetImage(Assets.icons.write.path),
                    color: SolidColors.posterTitle,
                  ),
                ),
                IconButton(
                  onPressed: (() => changeScreen(2)),
                  icon: ImageIcon(
                    AssetImage(Assets.icons.user.path),
                    color: SolidColors.posterTitle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
