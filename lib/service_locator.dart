import 'package:fets_mobile/features/features.dart';

import 'package:fets_mobile/helper/url_endpoints.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

GetIt serviceLocator = GetIt.instance;

Future<void> serviceLocatorInit() async {
  serviceLocator.registerFactory<FeedDataProvider>(() => FeedDataProvider());
  serviceLocator.registerFactory<FeedRepository>(() => FeedRepository());
  serviceLocator.registerSingleton<http.Client>(http.Client());
  serviceLocator
      .registerFactory<FeedBloc>(() => FeedBloc()..add(FetchAllFeeds()));
  await Hive.openBox<APIAuthData>(apiAuthDataHiveName);
  await Hive.openBox<User>('users');
}
