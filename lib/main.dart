// import 'package:fets_mobile/features/authentication/model/api_auth_data.dart';
import 'dart:io';

import 'package:fets_mobile/features/donor_projects/bloc/donor_projects_bloc.dart';
import 'package:fets_mobile/features/donor_projects/bloc/donor_projects_state.dart';
import 'package:fets_mobile/features/donor_projects/data/provider/donor_projects_dp.dart';
import 'package:fets_mobile/features/donor_projects/data/repository/donor_projets_repo.dart';
import 'package:fets_mobile/features/features.dart';
import 'package:fets_mobile/features/fetch_projecs/bloc/fetch_projects_bloc.dart';
import 'package:fets_mobile/features/fetch_projecs/bloc/fetch_projects_state.dart';
import 'package:fets_mobile/features/fetch_projecs/data/provider/fetch_projects_dp.dart';
import 'package:fets_mobile/features/fetch_projecs/data/repository/fetch_projects_repo.dart';
import 'package:fets_mobile/features/fund_project/bloc/fund_project_bloc.dart';
import 'package:fets_mobile/features/fund_project/bloc/fund_project_state.dart';
import 'package:fets_mobile/features/fund_project/data/provider/fund_project_dp.dart';
import 'package:fets_mobile/features/fund_project/data/repository/fund_project_repo.dart';
import 'package:fets_mobile/features/payment/bloc/payment_bloc.dart';
import 'package:fets_mobile/features/payment/data/provider/payment_dp.dart';
import 'package:fets_mobile/features/payment/data/repository/payment_repo.dart';
import 'package:fets_mobile/features/search_image/bloc/search_image_state.dart';
import 'package:fets_mobile/features/search_image/bloc/search_url_bloc.dart';
import 'package:fets_mobile/features/search_image/data/provider/search_image_provider.dart';
import 'package:fets_mobile/features/search_image/data/repository/search_image_repository.dart';
import 'package:fets_mobile/helper/helper.dart';
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
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/payment/bloc/payment_state.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  Stripe.publishableKey = dotenv.get('stripe_public_key');
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
  final PaymentRepo paymentRepo = PaymentRepo(
    paymentDP: PaymentDP(
      client: http.Client(),
      paymentController: PaymentController(
        client: http.Client(),
      ),
    ),
  );
  FundProjectRepo fundProjectRepo = FundProjectRepo(
    fundProjectDP: FundProjectDP(
      web3client: Web3Client(
        rpcUrl,
        http.Client(),
      ),
      client: http.Client(),
    ),
  );

  SearchImageRepo searchImageRepo = SearchImageRepo(
    searchImageDP: SearchImageDP(
      client: http.Client(),
    ),
  );
  DonorProjectsRepo donorProjectsRepo = DonorProjectsRepo(
    donorProjectsDP: DonorProjectsDP(
      web3client: Web3Client(
        rpcUrl,
        http.Client(),
      ),
      client: http.Client(),
    ),
  );
  runApp(
    MyApp(
      authUserRepo: authUserRepo,
      fetchProjectsRepo: fetchProjectsRepo,
      paymentRepo: paymentRepo,
      fundProjectRepo: fundProjectRepo,
      searchImageRepo: searchImageRepo,
      donorProjectsRepo: donorProjectsRepo,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.authUserRepo,
    required this.fetchProjectsRepo,
    required this.paymentRepo,
    required this.fundProjectRepo,
    required this.searchImageRepo,
    required this.donorProjectsRepo,
  }) : super(key: key);
  final AuthUserRepo authUserRepo;
  final FetchProjectsRepo fetchProjectsRepo;
  final PaymentRepo paymentRepo;
  final FundProjectRepo fundProjectRepo;
  final SearchImageRepo searchImageRepo;
  final DonorProjectsRepo donorProjectsRepo;

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
        BlocProvider(
          create: ((context) => FetchProjectsBloc(
                ProjectsIdleState(),
                fetchProjectsRepo: fetchProjectsRepo,
              )),
        ),
        BlocProvider(
          create: (context) => PaymentBloc(
            initialState: PaymentInitState(),
            paymentRepo: paymentRepo,
          ),
        ),
        BlocProvider(
          create: (context) => FundProjectBloc(
            initialState: FundProjectInitState(),
            fundProjectRepo: fundProjectRepo,
          ),
        ),
        BlocProvider(
          create: (conext) => SearchImageBloc(
            initialState: ImageSearchingState(),
            searchImageRepo: searchImageRepo,
          ),
        ),
        BlocProvider(
          create: (context) => DonorProjectBloc(
            donorProjectsRepo: donorProjectsRepo,
            initialState: UserDonationsInitState(),
          ),
        ),
        BlocProvider(
          create: (context) => FetchDonorProjectsBloc(
            initialState: ProjectsIdleState(),
            fetchProjectsRepo: fetchProjectsRepo,
          ),
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
