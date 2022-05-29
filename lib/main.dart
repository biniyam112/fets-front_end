import 'package:fets_mobile/features/authentication/model/api_auth_data.dart';
import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:fets_mobile/services/services.dart';
import 'package:fets_mobile/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter<APIAuthData>(APIAuthDataAdapter());
  await Hive.openBox<APIAuthData>("apiAuthData");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (_, context) => MaterialApp(
        title: 'FETS',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        routes: route,
        initialRoute: OnboardingScreen.route,
      ),
    );
  }
}
