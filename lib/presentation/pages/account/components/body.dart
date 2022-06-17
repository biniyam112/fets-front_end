import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:fets_mobile/services/size_config.dart';
import 'package:fets_mobile/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../../features/features.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String id = '471987491794871948';
  bool showId = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(20.sp),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: backgroundColor,
                    foregroundImage: AssetImage('assets/images/login.jpg'),
                  ),
                  horizontalSpacing(10.sp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'username',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        'email',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacing(30.sp),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: shadowColor,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account info',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 22),
                    ),
                    verticalSpacing(20.sp),
                    Text(
                      'user id',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.all(6.sp),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          showId = !showId;
                        });
                      },
                      child: Text(
                        showId ? id : id.replaceAll(RegExp(r'.(?=.{4})'), '*'),
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: lightTextColor,
                              fontSize: 18,
                              letterSpacing: 1.1,
                            ),
                      ),
                    ),
                    verticalSpacing(8.sp),
                    Text(
                      'Address',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    verticalSpacing(8.sp),
                    Text(
                      '09344242432',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: lightTextColor),
                    ),
                    verticalSpacing(3.sp),
                    Text(
                      'Johana streeet,Matoma',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: lightTextColor),
                    ),
                    verticalSpacing(3.sp),
                  ],
                ),
              ),
              verticalSpacing(30.sp),
              ListTile(
                onTap: () {
                  // ?navigate to credit card page
                  Navigator.pushNamed(context, MyCardScreen.route);
                },
                leading: const Icon(
                  CupertinoIcons.creditcard,
                  color: lightTextColor,
                ),
                title: Text(
                  'My Card',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ListTile(
                onTap: () {
                  Hive.box<User>('users').delete('user');
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.route, (route) => false);
                },
                leading: const Icon(
                  Icons.login_outlined,
                  color: lightTextColor,
                ),
                title: Text(
                  'Log out',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
