import 'package:fets_mobile/features/authentication/authentication.dart';
import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:fets_mobile/services/size_config.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late User user;

  @override
  void initState() {
    user = Hive.box<User>('users').get('user')!;
    BlocProvider.of<AuthUserBloc>(context).add(SignInEvent(
      signinModel: SigninModel(
        password: user.password!,
        username: user.userName!,
      ),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Logging in',
              style: Theme.of(context).textTheme.headline3,
            ),
            verticalSpacing(10.sp),
            Text(
              'Sign up completed,\n Logging in',
              style: Theme.of(context).textTheme.headline4,
            ),
            verticalSpacing(10.sp),
            BlocConsumer<AuthUserBloc, AuthUserState>(
              builder: (context, state) {
                if (state is UserAuthFailed) {
                  return SizedBox(
                    height: 50.sp,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AuthUserBloc>(context)
                              .add(SignInEvent(
                            signinModel: SigninModel(
                              password: user.password!,
                              username: user.userName!,
                            ),
                          ));
                        },
                        child: Text(
                          'Try again',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.white),
                        )),
                  );
                }
                return SizedBox(
                  height: 34.sp,
                  width: 34.sp,
                  child: const CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              },
              listener: (context, state) {
                if (state is UserSignedInSuccessfully) {
                  Navigator.pushNamed(context, DashboardScreen.route);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
