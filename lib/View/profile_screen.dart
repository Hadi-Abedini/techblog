import 'package:flutter/material.dart';
import 'package:techblog_codyad/gen/assets.gen.dart';
import 'package:techblog_codyad/my_Colors.dart';
import 'package:techblog_codyad/my_component.dart';
import 'package:techblog_codyad/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.bodymargen,
    required this.size,
    required this.texTheme,
  }) : super(key: key);

  final double bodymargen;
  final Size size;
  final TextTheme texTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: size.width / 6.5),
        Image(
          image: AssetImage(Assets.images.profileAvatar.path),
          height: size.width / 3.2,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 64),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                Image(image: AssetImage(Assets.icons.bluePen.path)).image,
                color: SolidColors.colorTitles,
              ),
              const SizedBox(width: 8),
              Text(
                MyStrings.imageProfEdit,
                style: texTheme.headline3,
              ),
            ],
          ),
        ),
        Text(
          'هادی زین العابدنی',
          style: texTheme.headline4,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 32),
          child: Text(
            "hadi.z.abedini@gmail.com",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        TecDivider(size: size),
        InkWell(
          splashColor: SolidColors.primaryColor,
          onTap: () {},
          child: SizedBox(
            height: 45,
            child: Center(
              child: Text(
                MyStrings.myFaivoritBlog,
                style: texTheme.headline4,
              ),
            ),
          ),
        ),
        TecDivider(size: size),
        InkWell(
          splashColor: SolidColors.primaryColor,
          onTap: () {},
          child: SizedBox(
            height: 45,
            child: Center(
              child: Text(
                MyStrings.myFaivoritPodCast,
                style: texTheme.headline4,
              ),
            ),
          ),
        ),
        TecDivider(size: size),
        InkWell(
          splashColor: Colors.red,
          onTap: () {},
          child: SizedBox(
            height: 45,
            child: Center(
              child: Text(
                MyStrings.logOut,
                style: texTheme.headline4,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
