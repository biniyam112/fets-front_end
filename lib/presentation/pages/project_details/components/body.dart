import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/services.dart';
import '../../../../theme/theme.dart';
import 'top_area.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const TopArea(),
              Padding(
                padding: EdgeInsets.all(18.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Children education in Kototo',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    verticalSpacing(2.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          color: primaryColor,
                          size: 16.sp,
                        ),
                        horizontalSpacing(2.sp),
                        Text(
                          'Ethiopia,Kototo',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: lightTextColor,
                                  ),
                        ),
                      ],
                    ),
                    verticalSpacing(16.sp),
                    Row(
                      children: [
                        Text(
                          '\$${343453}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          ' of ${7453453}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: lightTextColor),
                        ),
                      ],
                    ),
                    verticalSpacing(5.sp),
                    SizedBox(
                      height: 8.sp,
                      width: 1.sw / 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const LinearProgressIndicator(
                          color: primaryColor,
                          backgroundColor: shadowColor,
                          value: 2323424 / 4234234,
                        ),
                      ),
                    ),
                    verticalSpacing(16.sp),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'project details',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.black54),
                        ),
                        verticalSpacing(8.sp),
                        Text(
                          'It was the best of times, it was the worst of times, it was the age of wisdom, it was the age of foolishness, it was the epoch of belief, it was the epoch of incredulity, it was the season of Light, it was the season of Darkness, it was the spring of hope, it was the winter of despair, we had everything before us, we had nothing before us, we were all going direct to Heaven, we were all going direct the other way – in short, the period was so far like the present period, that some of its noisiest authorities insisted on its being received, for good or for evil, in the superlative degree of comparison only.It was the best of times, it was the worst of times, it was the age of wisdom, it was the age of foolishness, it was the epoch of belief, it was the epoch of incredulity, it was the season of Light, it was the season of Darkness, it was the spring of hope, it was the winter of despair, we had everything before us, we had nothing before us, we were all going direct to Heaven, we were all going direct the other way – in short, the period was so far like the present period, that some of its noisiest authorities insisted on its being received, for good or for evil, in the superlative degree of comparison only.',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: lightTextColor,
                                  ),
                        ),
                      ],
                    ),
                    verticalSpacing(16.sp),
                    Text(
                      'Companies involved',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    verticalSpacing(8.sp),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            3,
                            (index) => const CompanyCircle(
                              companyLogo: 'assets/images/signup.jpg',
                              companyName: 'Come fund me',
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpacing(20.sp),
                    SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SendDonation.route);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                        ),
                        child: Text(
                          'Donate now',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyCircle extends StatelessWidget {
  const CompanyCircle({
    Key? key,
    required this.companyLogo,
    required this.companyName,
  }) : super(key: key);
  final String companyLogo, companyName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32.sp,
            child: Container(
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white24,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    companyLogo,
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.indigo[800],
          ),
          verticalSpacing(8.sp),
          SizedBox(
            width: 62,
            child: Text(
              companyName,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
