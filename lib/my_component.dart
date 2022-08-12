import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog_codyad/fake_data.dart';
import 'package:techblog_codyad/model/data_odels.dart';
import 'my_colors.dart';

class TecDivider extends StatelessWidget {
  const TecDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
      thickness: 1,
    );
  }
}

class MainTags extends StatelessWidget {
  const MainTags({
    Key? key,
    required this.index,
    required this.textTheme,
    required this.list,
  }) : super(key: key);
  final int index;
  final TextTheme textTheme;
  final List list;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
        gradient: LinearGradient(
          colors: GradiantColors.hashTags,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          children: [
            const Icon(
              Icons.tag,
              color: SolidColors.posterTitle,
              size: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Text(
                list[index].title,
                style: textTheme.headline2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedTag extends StatelessWidget {
  const SelectedTag({
    Key? key,
    required this.index,
    required this.textTheme,
    required this.list,
  }) : super(key: key);
  final int index;
  final TextTheme textTheme;
  final List list;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
        color: SolidColors.hashTagsSelected,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Text(
                list[index].title,
                style: textTheme.headline4,
              ),
            ),
            Icon(
              CupertinoIcons.delete,
              color: Colors.red.shade400,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
