import 'package:fets_mobile/features/authentication/authentication.dart';
import 'package:fets_mobile/presentation/pages/pages.dart';
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
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');

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
            create: ((context) => AuthUser(Idle(), authUserRepo: authUserRepo)))
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        builder: (_, context) => MaterialApp(
          title: 'FETS',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          routes: route,
          initialRoute: OnboardingScreen.route,
        ),
      ),
    );
  }
}
