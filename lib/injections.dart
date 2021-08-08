import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:my_project/application/auth/sign_in_form/cubit/sign_in_form_cubit.dart';
import 'package:my_project/application/todo/form/todo_form_cubit.dart';
import 'package:my_project/application/todo/watcher/todos_watcher_cubit.dart';
import 'package:my_project/domain/auth/i_auth_facade.dart';
import 'package:my_project/domain/todo/todos_repository_facade.dart';
import 'package:my_project/infrastructure/auth/firebase_auth_facade.dart';
import 'package:my_project/infrastructure/todo/todos_repository.dart';

import 'application/auth/auth_cubit.dart';
import 'application/auth/sign_up_form/cubit/sign_up_form_cubit.dart';
import 'application/todo/actor/todo_actor_cubit.dart';
import 'domain/connection_checker/connection_checker.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton(ConnectionChecker());
  getIt.registerSingleton<IAuthFacade>(FirebaseAuthFacade(getIt<FirebaseAuth>(), getIt<ConnectionChecker>()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<IAuthFacade>()));
  getIt.registerFactory<SignInFormCubit>(() => SignInFormCubit(getIt<IAuthFacade>()));
  getIt.registerFactory<SignUpFormCubit>(() => SignUpFormCubit(getIt<IAuthFacade>()));

  getIt.registerSingleton<TodosRepositoryFacade>(TodosRepository(getIt<FirebaseFirestore>()));
  getIt.registerFactory<TodosWatcherCubit>(() => TodosWatcherCubit(getIt<TodosRepositoryFacade>()));
  getIt.registerFactory(() => TodoActorCubit(getIt<TodosRepositoryFacade>()));
}
