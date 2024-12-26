import 'package:doctorly/bloc/login/login_bloc.dart';
import 'package:get_it/get_it.dart';

import '../api/auth_api_impl.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  //Repositories
  serviceLocator.registerLazySingleton(() => AuthApiImpl());
  serviceLocator.registerLazySingleton(() => LoginBloc());
}
