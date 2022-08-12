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

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var bodymargen = size.width / 12.53;

    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: SolidColors.scaffoldBg,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.fromLTRB(bodymargen / 2, 0, bodymargen / 2, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: Icon(
                    Icons.dehaze,
                    size: size.height / 25,
                    color: Colors.black,
                  ),
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
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBg,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    Assets.images.logo.path,
                    scale: 2.5,
                  ),
                ),
                Divider(
                  color: SolidColors.dividerColor.withOpacity(0.2),
                  thickness: 3,
                ),
                ListTile(
                  title: Text(
                    "پروفایل کاربری",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: SolidColors.dividerColor.withOpacity(0.2),
                  thickness: 3,
                ),
                ListTile(
                  title: Text(
                    "درباره تک‌بلاگ",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: SolidColors.dividerColor.withOpacity(0.2),
                  thickness: 3,
                ),
                ListTile(
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: SolidColors.dividerColor.withOpacity(0.2),
                  thickness: 3,
                ),
                ListTile(
                  title: Text(
                    "تک‌بلاگ در گیت هاب",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: SolidColors.dividerColor.withOpacity(0.2),
                  thickness: 3,
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
                      bodymargen: bodymargen, size: size, textTheme: textTheme),
                  const RegisterIntro(),
                  ProfileScreen(
                      bodymargen: bodymargen, size: size, textTheme: textTheme),
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
