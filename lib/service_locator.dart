import 'package:fets_mobile/features/features.dart';
import 'package:fets_mobile/features/task/task.dart';

import 'package:fets_mobile/helper/url_endpoints.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> serviceLocatorInit() async {
  serviceLocator.registerFactory<FeedDataProvider>(() => FeedDataProvider());
  serviceLocator.registerFactory<FeedRepository>(() => FeedRepository());
  serviceLocator.registerSingleton<http.Client>(http.Client());
  serviceLocator
      .registerFactory<FeedBloc>(() => FeedBloc()..add(FetchAllFeeds()));
  serviceLocator.registerFactory<SubprojectBloc>(() => SubprojectBloc());
  serviceLocator.registerSingleton<Web3Client>(
      Web3Client(rpcUrl, serviceLocator.get<http.Client>()));
  serviceLocator
      .registerFactory<SubProjectDataprovider>(() => SubProjectDataprovider());
  serviceLocator
      .registerFactory<SubProjectRepository>(() => SubProjectRepository());
  serviceLocator.registerFactory<TaskDataprovider>(() => TaskDataprovider());
  serviceLocator.registerFactory<TaskRepository>(() => TaskRepository());
  serviceLocator.registerFactory<TaskBloc>(() => TaskBloc());
  await Hive.openBox<APIAuthData>(apiAuthDataHiveName);
  await Hive.openBox<User>('users');
}
