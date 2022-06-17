import 'package:fets_mobile/features/authentication/model/api_auth_data.dart';
import 'package:fets_mobile/features/features.dart';
import 'package:fets_mobile/helper/url_endpoints.dart';
import 'package:fets_mobile/features/authentication/authentication.dart';
import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:fets_mobile/service_locator.dart';
import 'package:fets_mobile/services/services.dart';
import 'package:fets_mobile/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<User>(UserAdapter());

  Hive.registerAdapter<APIAuthData>(APIAuthDataAdapter());
  await serviceLocatorInit();
  final AuthUserRepo authUserRepo = AuthUserRepo(
    authUserDP: AuthUserDP(
      client: http.Client(),
    ),
  );

  runApp(MyApp(
    authUserRepo: authUserRepo,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.authUserRepo}) : super(key: key);
  final AuthUserRepo authUserRepo;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => AuthUserBloc(
                AuthIdle(),
                authUserRepo: authUserRepo,
              )),
        ),
        BlocProvider(create: (context) => serviceLocator<FeedBloc>())
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        builder: (_, context) => MaterialApp(
          title: 'FETS',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          routes: route,
          initialRoute: SignUpScreen.route,
        ),
      ),
    );
  }
}
