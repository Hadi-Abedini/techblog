import 'package:flutter/material.dart';
import 'package:techblog_codyad/fake_data.dart';
import 'package:techblog_codyad/gen/assets.gen.dart';
import 'package:techblog_codyad/my_Colors.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: bodymargen, right: bodymargen),
            child: Stack(
              children: [
                Container(
                  height: size.height / 4.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(fakeData["imageAsset"]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                        colors: gradiantColors.homePosterCover,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 0.7, 0.95]),
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: size.height / 39.28,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            fakeData["writer"] + ' - ' + fakeData["date"],
                            style: texTheme.subtitle1,
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.visibility,
                                  color: solidColors.subText,
                                  size: 17,
                                ),
                              ),
                              Text(
                                'بازدید ' + fakeData["view"],
                                style: texTheme.subtitle1,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: size.height / 60),
                      Text(
                        fakeData["title"] + '...',
                        style: texTheme.headline1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 32, 0, 24),
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: tagList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        8, 8, index == 0 ? bodymargen : 8, 8),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                        gradient: LinearGradient(
                            colors: gradiantColors.hashTags,
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.tag,
                              color: solidColors.posterTitle,
                              size: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: Text(
                                tagList[index].title!,
                                style: texTheme.headline2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(bodymargen, 0, bodymargen, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ImageIcon(
                  AssetImage(Assets.icons.bluePen.path),
                  color: solidColors.colorTitles,
                ),
                const SizedBox(width: 8),
                Text(
                  'مشاهده داغ ترین نوشته ها ',
                  style: texTheme.headline3,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
            child: SizedBox(
              height: size.height / 3.5,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: blogList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        8, 8, index == 0 ? bodymargen : 8, 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height / 5.3,
                          width: size.width / 2.4,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                  image: DecorationImage(
                                      image: Image.network(
                                              blogList[index].imageUrl)
                                          .image,
                                      fit: BoxFit.cover),
                                ),
                                foregroundDecoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                  gradient: LinearGradient(
                                    colors: gradiantColors.blogPost,
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 0,
                                left: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      blogList[index].writer,
                                      style: texTheme.subtitle1,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          blogList[index].views,
                                          style: texTheme.subtitle1,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(right: 6),
                                          child: Icon(
                                            Icons.visibility,
                                            color: solidColors.subText,
                                            size: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: SizedBox(
                            width: size.width / 2.4,
                            child: Text(
                              blogList[index].title,
                              style: texTheme.headline4,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(bodymargen, 0, bodymargen, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ImageIcon(
                  AssetImage(Assets.icons.microphon.path),
                  color: solidColors.colorTitles,
                ),
                const SizedBox(width: 8),
                Text(
                  'مشاهده داغ ترین پادکست ها ',
                  style: texTheme.headline3,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
            child: SizedBox(
              height: size.height / 4.2,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: blogList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        8, 8, index == 0 ? bodymargen : 8, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height / 5.5,
                          width: size.width / 2.6,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                  image: DecorationImage(
                                      image: Image.network(
                                              podcastList[index].imageUrl)
                                          .image,
                                      fit: BoxFit.cover),
                                ),
                                foregroundDecoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                  gradient: LinearGradient(
                                    colors: gradiantColors.blogPost,
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 0,
                                left: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      podcastList[index].writer,
                                      style: texTheme.subtitle1,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          podcastList[index].view,
                                          style: texTheme.subtitle1,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(right: 6),
                                          child: Icon(
                                            Icons.visibility,
                                            color: solidColors.subText,
                                            size: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width / 2.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                podcastList[index].title,
                                style: texTheme.headline4,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: size.height / 9.5,
          ),
        ],
      ),
    );
  }
}
