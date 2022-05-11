import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:fets_mobile/services/size_config.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({Key? key}) : super(key: key);

  static const route = 'project-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopArea(),
              verticalSpacing(20.sp),
              Padding(
                padding: const EdgeInsets.all(12),
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
                    verticalSpacing(10.sp),
                    Row(
                      children: [
                        Text(
                          '\$${3453453}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          'of ${13453453}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: lightTextColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                      width: 1.sw / 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const LinearProgressIndicator(
                          color: primaryColor,
                          value: 2323424 / 4234234,
                        ),
                      ),
                    ),
                    verticalSpacing(20.sp),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: .3.sh,
                      ),
                      child: Text(
                        'project details',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: lightTextColor),
                      ),
                    ),
                    verticalSpacing(20),
                    Text(
                      'Companies involved',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: SizedBox(
                                height: 80.sp,
                                width: 80.sp,
                                child: Image.asset('assets/images/login.jpg'),
                              ),
                            ),
                            Text(
                              'come fun me',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
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

class TopArea extends StatelessWidget {
  const TopArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .46.sh,
      width: 1.sw,
      child: Stack(
        children: [
          Positioned(
            top: 60.sp,
            left: 40.sp,
            child: CustomBackButton(
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ),
          Image.asset('assets/images/forgot password.jpg'),
        ],
      ),
    );
  }
}
