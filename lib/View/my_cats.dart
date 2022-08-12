import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:techblog_codyad/fake_data.dart';
import 'package:techblog_codyad/gen/assets.gen.dart';
import 'package:techblog_codyad/my_colors.dart';
import 'package:techblog_codyad/my_component.dart';
import 'package:techblog_codyad/my_strings.dart';

class MyCats extends StatefulWidget {
  const MyCats({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(64, 32, 64, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(Assets.images.tcbot.path),
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 32, 0, 64),
                    child: RichText(
                      text: TextSpan(
                        text: MyStrings.verifydeEmail,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    style: textTheme.headline4,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintTextDirection: TextDirection.rtl,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 64, 0, 32),
                    child: Text(
                      MyStrings.choseLabel,
                      style: textTheme.headline4,
                    ),
                  ),
                  SizedBox(
                    height: 115,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      itemCount: tagList.length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        crossAxisCount: 2,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: MainTags(
                            index: index,
                            textTheme: textTheme,
                            list: tagList,
                          ),
                          onTap: () {
                            checkRepetSelectedTag(index);
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Image.asset(
                    Assets.icons.downCatArrow.path,
                    scale: 2,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 120,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      itemCount: selectedTagList.length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        crossAxisCount: 2,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(
                              () {
                                selectedTagList.remove(0);
                              },
                            );
                          },
                          child: SelectedTag(
                            index: index,
                            textTheme: textTheme,
                            list: selectedTagList,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(64, 16, 64, 16),
                      child: Text("ادامه"),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkRepetSelectedTag(int index) {
    return setState(
      () {
        var repet = false;
        for (int i = 0; i < selectedTagList.length; i++) {
          if (tagList[index].title == selectedTagList[i].title) {
            repet = true;
          }
        }
        if (repet != true) {
          selectedTagList.add(tagList[index]);
        }
      },
    );
  }
}
