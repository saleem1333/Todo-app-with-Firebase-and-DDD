import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/application/auth/auth_cubit.dart';
import 'package:my_project/presentation/sign_in_form/sign_in_form_screen.dart';
import 'package:my_project/presentation/todos/todos_overview_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<AuthCubit>().state.when(
          initial: () => const CircularProgressIndicator().centered(),
          authenticated: () => TodosOverviewScreen(),
          unAuthenticated: () => SignInFormScreen()),
    );
  }
}
