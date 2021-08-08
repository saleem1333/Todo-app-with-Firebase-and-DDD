import 'package:auto_route/annotations.dart';
import 'package:my_project/presentation/sign_in_form/sign_in_form_screen.dart';
import 'package:my_project/presentation/sign_up_form/sign_up_form_screen.dart';

import 'package:my_project/presentation/splash/splash_screen.dart';
import 'package:my_project/presentation/todos/todos_overview_screen.dart';


@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SplashScreen, initial: true),
  AutoRoute(page: SignInFormScreen),
  AutoRoute(page: SignUpFormScreen),
  AutoRoute(page: TodosOverviewScreen)
])
class $AppRouter {}
