import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'hidden_button.dart';
import 'page_count_indicator.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String splashImage1;
  late String splashImage2;
  late String splashImage3;

  @override
  void initState() {
    super.initState();
    splashImage1 = 'assets/images/reset password.jpg';
    splashImage2 = 'assets/images/reset password.jpg';
    splashImage3 = 'assets/images/reset password.jpg';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(
        Image.asset('assets/images/reset password.jpg').image, context);
    precacheImage(
        Image.asset('assets/images/reset password.jpg').image, context);
    precacheImage(
        Image.asset('assets/images/reset password.jpg').image, context);
  }

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    precacheImage(
        Image.asset('assets/images/reset password.jpg').image, context);
    precacheImage(
        Image.asset('assets/images/reset password.jpg').image, context);
    precacheImage(
        Image.asset('assets/images/reset password.jpg').image, context);
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                activeIndex = index;
              });
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              List<Color> splashColors = [
                const Color(0xffffffff),
                const Color(0xffFDDBD9),
                const Color(0xffffffff),
              ];
              List<String> splashTitle = [
                'Fund projets',
                'Stay updated about projects',
                'Track your donation',
              ];
              List<String> splashSubTitle = [
                'Fund projets of your interest',
                'Stay updated with projets progress \nwhere ever you are',
                'Build trust through block chain',
              ];
              List<String> splashImagesPath = [
                splashImage1,
                splashImage2,
                splashImage3,
              ];
              return Container(
                height: 1.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  color: splashColors[index],
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      const Spacer(flex: 3),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          splashTitle[index],
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                fontFamily: GoogleFonts.montserrat().fontFamily,
                                color: Colors.black.withOpacity(.8),
                              ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 1.sh * .5,
                        width: 1.sw,
                        child: Image.asset(
                          splashImagesPath[index],
                          colorBlendMode: BlendMode.lighten,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          splashSubTitle[index],
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                fontFamily: GoogleFonts.montserrat().fontFamily,
                                wordSpacing: 1.1,
                                color: Colors.black.withOpacity(.7),
                              ),
                        ),
                      ),
                      const Spacer(),
                      HiddenButton(
                          isVisible: index == splashSubTitle.length - 1),
                      const Spacer(flex: 3),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 40.sp,
          child: Row(
            children: [
              ...List.generate(
                3,
                (index) => PageCountIndicator(
                  isActive: activeIndex == index,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
