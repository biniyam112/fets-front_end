// import 'package:fets_mobile/features/authentication/model/api_auth_data.dart';
import 'package:fets_mobile/features/features.dart';
import 'package:fets_mobile/features/fetch_projecs/bloc/fetch_projects_bloc.dart';
import 'package:fets_mobile/features/fetch_projecs/bloc/fetch_projects_state.dart';
import 'package:fets_mobile/features/fetch_projecs/data/provider/fetch_projects_dp.dart';
import 'package:fets_mobile/features/fetch_projecs/data/repository/fetch_projects_repo.dart';
import 'package:fets_mobile/features/task/bloc/bloc.dart';
import 'package:fets_mobile/helper/url_endpoints.dart';
import 'package:fets_mobile/features/authentication/authentication.dart';
import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:fets_mobile/service_locator.dart';
import 'package:fets_mobile/services/services.dart';
import 'package:fets_mobile/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = const String.fromEnvironment('stripe_public_key');
  await Hive.initFlutter();
  Hive.registerAdapter<User>(UserAdapter());

  Hive.registerAdapter<APIAuthData>(APIAuthDataAdapter());
  await serviceLocatorInit();
  final AuthUserRepo authUserRepo = AuthUserRepo(
    authUserDP: AuthUserDP(
      client: http.Client(),
    ),
  );

  final FetchProjectsRepo fetchProjectsRepo = FetchProjectsRepo(
    fetchProjectsDP: FetchProjectsDP(
      client: http.Client(),
      web3client: Web3Client(
        rpcUrl,
        http.Client(),
      ),
    ),
  );
  runApp(
    MyApp(
      authUserRepo: authUserRepo,
      fetchProjectsRepo: fetchProjectsRepo,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.authUserRepo,
    required this.fetchProjectsRepo,
  }) : super(key: key);
  final AuthUserRepo authUserRepo;
  final FetchProjectsRepo fetchProjectsRepo;

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
        BlocProvider(create: (context) => serviceLocator<FeedBloc>()),
        BlocProvider(create: (context) => serviceLocator<SubprojectBloc>()),
        BlocProvider(create: (context) => serviceLocator<TaskBloc>()),
        BlocProvider(
          create: ((context) => FetchProjectsBloc(
                ProjectsIdleState(),
                fetchProjectsRepo: fetchProjectsRepo,
              )),
        ),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        builder: (_, context) => MaterialApp(
          title: 'FETS',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          routes: route,
          initialRoute: DashboardScreen.route,
        ),
      ),
    );
  }
}
