import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/application/auth/auth_cubit.dart';
import 'package:my_project/injections.dart';

import 'routes/routes.gr.dart';

final _router = AppRouter();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUp();
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => getIt<AuthCubit>()..checkAuthenticaion(),
      child: MaterialApp.router(
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xffE8EEEF), appBarTheme: AppBarTheme(color: Color(0xffE8EEEF), elevation: 0.0, iconTheme: IconThemeData(color: Colors.black))),
        routerDelegate: _router.delegate(),
        routeInformationParser: _router.defaultRouteParser(),
      ),
    );
  }
}
